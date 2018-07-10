# Steve's workspace / dev setup

## Sublime

```
ln -s sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

## iTerm 2

Go to settings and use 'Load preferences from a custom folder or URL' option

## ZSH

Install zsh (newer version instead of one shipping with MacOS):
`brew install zsh zsh-completions z zsh-syntax-highlighting`

Test with `echo $SHELL` after a restart of the shell

Put sensitive env variables / custom config in `~/.env` or at least touch the file so that it exists. Then do this:
`ln -s .zshrc ~/.zshrc`

Install oh-my-zsh
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
## Karabiner (keyboard settings)

`brew cask install karabiner-elements`
`ln -s ~/git/my-workspace/karabiner ~/.config`

Restart the system after this.

## MacOS

Sets some OS-level preferences.

`sh defaults.sh`

Logout and login after this.

