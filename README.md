# dotfiles

[![chezmoi](https://img.shields.io/badge/managed%20with-chezmoi-5961ff?logo=homeassistant&logoColor=white)](https://www.chezmoi.io/)
[![Platforms](https://img.shields.io/badge/platform-macOS%20%7C%20Arch-333333?logo=gnometerminal&logoColor=white)](#install)
[![Profile](https://img.shields.io/badge/profile-cli%20%7C%20gui-555555)](#setup-profile)
[![Shell](https://img.shields.io/badge/shell-zsh-f4d137?logo=gnu-bash&logoColor=111)](dot_zshrc.tmpl)
[![Herdr](https://img.shields.io/badge/multiplexer-Herdr-333333)](dot_config/herdr/config.toml)
[![Editor](https://img.shields.io/badge/editor-Neovim%20%7C%20Vim-57A143?logo=neovim&logoColor=white)](dot_config/nvim)
[![Terminal](https://img.shields.io/badge/terminal-Ghostty-333333?logo=gnometerminal&logoColor=white)](dot_config/ghostty)

## Install
HTTPS: `chezmoi init navyracooon --apply`  
SSH: `chezmoi init navyracooon --ssh --apply`

## Abstract
シンプルで再現しやすい個人用 dotfiles です．  
macOS と Arch Linux を主な対象にしています．

## Setup Profile
初回セットアップ時に `cli` / `gui` を選択します．

- `cli`: SSH 先やリモート環境向けの最小構成
- `gui`: ローカルのデスクトップ環境向けに，Ghostty などの GUI アプリケーションも追加

## What's Inside
- [Zsh](https://www.zsh.org/)
- [Herdr](https://herdr.dev/)
- [Neovim](https://github.com/neovim/neovim) / [Vim](https://www.vim.org/)
- [Ghostty](https://ghostty.org/)  (※ GUI profile)
- [Amethyst](https://github.com/ianyh/Amethyst)  (※ macOS + GUI profile)
