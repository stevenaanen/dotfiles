#!/bin/sh

mkdir -p ~/.config
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf ${BASE}/config/.gitconfig ~/.gitconfig
ln -sf ${BASE}/config/.gitignore_global ~/.gitignore_global
ln -sf ${BASE}/config/.zshrc ~/.zshrc
ln -sf ${BASE}/config/karabiner ~/.config/karabiner
ln -sf ${BASE}/config/nvim ~/.config/nvim
ln -sf ${BASE}/config/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

