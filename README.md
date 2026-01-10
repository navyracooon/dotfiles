# dotfiles

[![chezmoi](https://img.shields.io/badge/managed%20with-chezmoi-5961ff?logo=homeassistant&logoColor=white)](https://www.chezmoi.io/)
[![Platforms](https://img.shields.io/badge/platform-macOS%20%7C%20Arch-333333?logo=gnometerminal&logoColor=white)](#セットアップ--install)
[![Shell](https://img.shields.io/badge/shell-zsh-f4d137?logo=gnu-bash&logoColor=111)](dot_zshrc.tmpl)
[![tmux](https://img.shields.io/badge/multiplexer-tmux-1BB91F?logo=tmux&logoColor=white)](dot_tmux.conf)
[![Editor](https://img.shields.io/badge/editor-Neovim%20%7C%20Vim-57A143?logo=neovim&logoColor=white)](dot_config/nvim)
[![Terminal](https://img.shields.io/badge/terminal-Alacritty-f46d01?logo=alacritty&logoColor=white)](dot_config/alacritty)

## Install
HTTPS: `chezmoi init navyracooon --apply`  
SSH: `chezmoi init navyracooon --ssh --apply`

## What's Inside
#### [Zsh](https://www.zsh.org/)
macOS 標準のシェルで、補完や powerline が用意された状態になります。

#### [tmux](https://github.com/tmux/tmux)
セッション常駐型のターミナル multiplexer。起動時に自動アタッチし、レイアウト操作スクリプトで素早く分割を作成できます。

#### [Neovim](https://github.com/neovim/neovim) / [Vim](https://www.vim.org/)
Lua を主体に構成した Neovim 設定。LSP、補完、検索を最小限のプラグインでまとめています。
Neovim が使えない環境でも `dot_vimrc` を入れておけば最低限の設定で使いやすい Vim を使用できます。

#### [Alacritty](https://github.com/alacritty/alacritty)
GPU 描画の Rust 製ターミナルエミュレータ。

#### [Amethyst](https://github.com/ianyh/Amethyst)
macOS 用タイル型ウィンドウマネージャ。
