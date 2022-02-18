#!/bin/sh

# Defaults
echo "Setting OS defaults..."
source defaults.sh

# Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Apps
brew update
read -p "Press [Enter] key to install apps (takes a while)"
echo "Installing apps..."
brew bundle install
brew cleanup

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Config
echo "Linking config files..."
source link-config.sh

# Install vim-plug for plugins in nvim - 
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +PlugUpdate +qall

echo "All set up... let's start shipping Stevie 🚀"
