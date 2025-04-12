# dotfiles
## 背景
[chezmoi](https://www.chezmoi.io/)を利用する形でdotfilesを再整備した

## 使い方
1. `chezmoi init navyracooon`
2. `sh ~/.local/share/chezmoi/scripts/create_chezmoi_toml.sh`
3. `chezmoi apply -v`

## 注意点
#### WSLの場合
クリップボードの操作に`win32yank.exe`を要求されます  
個別でインストールするか、Windows版Neovimをインストールすることで解決できます
