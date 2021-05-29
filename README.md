# Steve's workspace / dev setup

## TODO

- [ ] Alfred & config
- [ ] VSCode config
- [ ] Git config
- [ ] Full install script
- [ ] Homebrew package install script
- [ ] Homebrew Cask install script (all available apps using this)
- [ ] Add menu to install script to select categories to install


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

## neovim

Package manager (plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Config (including packages to install):
`ln -s ~/git/my-workspace/.config/nvim ~/.config`

`nvim +PlugInstall`

## Karabiner (keyboard settings)

`brew cask install karabiner-elements`
`ln -s ~/git/my-workspace/karabiner ~/.config`

Restart the system after this.

## MacOS

Sets some OS-level preferences.

`sh defaults.sh`

Logout and login after this.

## Fonts

Install (https://github.com/tonsky/FiraCode)[FiraCode].

