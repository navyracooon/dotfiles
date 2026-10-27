---
name: ci-check
description: PR の CI を確認する手順。「緑になったか」を見るのではなく、必須チェックを branch protection と ruleset の両方から引き、success でないものを設計どおりの skip・承認ゲート・本当の失敗に分類し、それぞれの根拠を workflow の `if` 条件やゲート設定で裏取りする。デプロイを伴う場合は成果物のタグが実在することまで確認する。「CI を確認して」「CI どう」と依頼されたとき、および push 後に CI の結果を報告するときに使用する。
---

# CI 確認の手順

## 原則

緑かどうかではなく、内容を見る。success でないチェックには「そうであるのが正常」なものが混ざっているので、分類せずに「CI が落ちている」「まだ待ち」と報告しない。

まず必須か非必須かで分け、そのうえで success、設計どおりに skip されたもの、承認ゲート、本当の失敗に割る。すべてのチェックがこの形に割り振れるまで確認は終わっていない。非必須の失敗はマージを止めないので、必須の失敗と混ぜずに報告する。

## 必須チェックの特定

必須の指定は 2 箇所に分かれている。片方だけ見ると取り落とす。

classic branch protection を引く。

    gh api repos/{owner}/{repo}/branches/{base}/protection \
      --jq '{contexts:.required_status_checks.contexts, strict:.required_status_checks.strict, reviews:.required_pull_request_reviews.required_approving_review_count}'

ruleset を引く。`rulesets` で一覧を出し、`branch` target のものを個別に開いて `required_status_checks` と `pull_request` のパラメータを読む。

    gh api repos/{owner}/{repo}/rulesets --jq '.[] | [.id, .name, .target, .enforcement] | @tsv'
    gh api repos/{owner}/{repo}/rulesets/{id} --jq '{name, conditions, rules:[.rules[]|{type, checks:(.parameters.required_status_checks//empty), params:.parameters}]}'

`strict` が false なら、base への追随はマージ条件ではない。追随が必要かどうかを CI の赤から推測しない。

ruleset の `pull_request` パラメータのうち報告に効くもの。`require_last_push_approval` が true なら、push した時点で既存の approve はマージ条件を満たさなくなる（再承認が必要）。`dismiss_stale_reviews_on_push` と `required_approving_review_count` も合わせて読む。承認済みの PR に push を提案するときは、この 2 つを確認してから提案する。

## チェック結果の収集

`gh pr view --json statusCheckRollup` は check-run と commit status を混ぜて返し、状態のフィールド名が異なる（`conclusion` と `state`）ので、素朴に読むと取り落とす。2 面を別に引く。

    gh pr view {n} --json headRefOid --jq .headRefOid
    gh api --paginate repos/{owner}/{repo}/commits/{sha}/check-runs --jq '.check_runs[] | [(.conclusion//"-"), .name] | @tsv' | sort
    gh api --paginate repos/{owner}/{repo}/commits/{sha}/status --jq '.statuses[] | [.context, .state, .description] | @tsv'

sha は PR head を取ってから使う。ブランチ名で引くと force-push 直後にずれる。

実行中のものが残っているときは、完了を待つ命令をバックグラウンドで回し（Claude Code なら `run_in_background`）、ターンは直ちに依頼者へ返す。前面でポーリングしない。依頼者が「通るまで待って」と言った場合を除き、CI を待つためにターンを持ち続けない。バックグラウンドのジョブと完了の通知が無い環境では待たずに返し、求められた時点で引き直す。他のスキルで CI を待つ場面も、この節に従う。

    until [ "$(gh api repos/{owner}/{repo}/commits/{sha}/check-runs --jq '[.check_runs[]|select(.status!="completed")]|length' 2>/dev/null || echo 9)" = "0" ]; do sleep 30; done

## skip の裏取り

skipped を「たぶん条件付き実行だろう」で済ませない。ジョブの `if` を読み、その条件が今の PR で成立しないことを述べる。

チェック名から workflow を辿るには、check-run の `html_url` から run id を取り、workflow のパスを引く。

    gh api repos/{owner}/{repo}/commits/{sha}/check-runs --jq '.check_runs[] | select(.name=="{name}") | .html_url'
    gh api repos/{owner}/{repo}/actions/runs/{run_id} --jq '[.name, .path, .event] | @tsv'

リポジトリに commit されていない workflow（organization の required workflows など）もある。ローカルの grep で見つからないことを「存在しない」と扱わず、API で辿る。

よくある skip の形。base ブランチ限定のジョブ（`if: github.ref_name == 'main' || github.ref_type == 'tag'`）、ラベル駆動のジョブ（`if: contains(github.event.pull_request.labels.*.name, '...')`）、環境ごとに分けたジョブのうち 1 つだけが走る型。

## 承認ゲートと失敗の区別

pending のまま動かないチェックは、CI の遅れではなく、人の承認を待つゲートのことがある。何で止まっているかはチェックの詳細（status の description、check-run の output）から引いて述べる。

承認が入るまで pending が正常なものを「CI 待ち」として報告しない。承認ゲートであること、承認が入れば解けることを明示する。

## デプロイを伴うとき

success は必要条件でしかない。デプロイに使う成果物が実在するかを別に確認する。

この節の読み取り（成果物の実在確認、稼働中の成果物の引き直し）は、CI の結果を読むために必要なので、AGENTS.md の Workstyle 節の例外として指示なしで行ってよい（読み取りの権限がある環境に限る）。デプロイの実行や書き込みは含まない。

成果物（イメージなど）に識別子を付けるジョブまで success であること。その識別子がレジストリに実在すること。レジストリの CLI でタグの一覧を引いて確かめる。

## ローカルで回せなかった検証の扱い

ローカルで実行できなかったテストがあるときは、CI の該当ジョブがそれを含むことを workflow の実装で確かめてから「CI で通った」と述べる。ジョブ名からの推測で埋めない。

## 報告

必須と非必須に分けて述べ、件数を出す。skip には根拠（`if` 条件）を添える。失敗が 0 なら 0 と書く。

「緑です」で終えない。何が必須で、何が必須でないのに success で、何が正常に skip され、何が承認待ちなのかが読み取れる形にする。
