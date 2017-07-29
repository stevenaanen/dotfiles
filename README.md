# Steve's workspace / dev setup

## Sublime

```
ln -s sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

## iTerm 2

Go to settings and use 'Load preferences from a custom folder or URL' option

## ZSH

Put sensitive env variables / custom config in `~/.env` or at least touch the file so that it exists. Then do this:
`ln -s .zshrc ~/.zshrc`
