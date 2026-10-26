#!/bin/bash

# 公開しないスキル（~/.config/ai/private/skills/<name>/）を Claude Code と Codex から読めるようにする。

set -euo pipefail

private="$HOME/.config/ai/private/skills"

for dir in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
    mkdir -p "$dir"
    # 壊れた link を片付ける
    for link in "$dir"/*; do
        if [[ -L "$link" && ! -e "$link" ]]; then
            rm "$link"
        fi
    done
    [[ -d "$private" ]] || continue
    for skill in "$private"/*/; do
        [[ -f "$skill/SKILL.md" ]] || continue
        name=$(basename "$skill")
        target="$dir/$name"
        # 公開スキルや外部スキル（実体も symlink も）は上書きしない
        if [[ -e "$target" || -L "$target" ]] && [[ "$(readlink "$target" 2>/dev/null)" != "$private"/* ]]; then
            printf 'skipped private skill %s: %s exists\n' "$name" "$target" >&2
            continue
        fi
        ln -sfn "${skill%/}" "$target"
    done
done
