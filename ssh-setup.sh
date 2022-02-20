#!/bin/sh

if [ $(ls -al ~/.ssh/*.pub 2>/dev/null | wc -l) -gt 0 ]; then
  echo 'Existing keys present, stopping';
  exit 0;
fi

read -p "Enter Github email: " email
ssh-keygen -t ed25519 -C $email

if test ! "~/.ssh/config"; then
  echo "Creating .ssh/config..."
  echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  " > ~/.ssh/config
fi

echo "Adding key to agent..."
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

read -p "Press [ENTER] to open Github and add the generated public key from clipboard"
pbcopy < ~/.ssh/id_ed25519.pub
open https://github.com/settings/keys

read -p "Press [ENTER] when done"

echo "Testing connection..."
ssh -T git@github.com

