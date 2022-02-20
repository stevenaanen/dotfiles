#!/bin/sh

# Make/xcode
if test ! $(xcode-select -p); then
  echo "Installing xcode-stuff"
  xcode-select --install
fi

# SSH
if [ $(ls -al ~/.ssh/*.pub 2>/dev/null | wc -l) -eq 0 ]; then
  echo 'No SSH keys found, proceeding to setup...';
  source ./ssh-setup.sh
  echo 'Doing git pull as test for SSH'
  git pull --ff-only
  sleep 4
fi

# Defaults
echo "Setting OS defaults..."
source ./defaults.sh

# Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Apps
brew update
read -p "Press [Enter] key to install apps (takes a while)"
echo "Installing apps..."
brew bundle install --no-upgrade
brew cleanup

# ZSH
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh
echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Config
echo "Linking config files..."
touch ~/.env
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf ${BASE}/.mackup.cfg ~/.mackup.cfg
mackup restore

# Install vim-plug for plugins in nvim - 
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +PlugUpdate +qall

echo "All set up... let's start shipping Stevie 🚀"
