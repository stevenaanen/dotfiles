#!/bin/sh

set -e
set -o pipefail

# Make/xcode
if test ! $(xcode-select -p 2>/dev/null); then
  echo "Installing xcode-stuff"
  xcode-select --install
  read -p "Press [Enter] once xcode install is complete"
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

# Config
echo "Linking config files..."
touch ~/.env
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf ${BASE}/.mackup.cfg ~/.mackup.cfg
mackup restore

# Neovim using AstroNvim
if test ! -d ~/.config/nvim; then
  echo "Installing AstroNvim..."
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  ln -sf ${BASE}/config/.config/nvim/lua/user ~/.config/nvim/lua/user
  nvim  --headless -c 'quitall'
  echo "AstroNvim installed"
else
  echo "Skipping AstroNvim install - nvim config already present"
fi

# ZSH
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh
echo "Setting ZSH as shell..."
chsh -s /bin/zsh
$(brew --prefix)/opt/fzf/install

echo "All set up... let's start shipping Stevie 🚀"
