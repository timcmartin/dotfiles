# Dotfiles

This repository borrows heavily from [jcarley/dotmatrix](https://github.com/jcarley/dotmatrix),
but was tweaked for use with [Dotbot](https://github.com/anishathalye/dotbot) and [Strap](https://github.com/timcmartin/strap).

This config makes use of powerline and tmux-powerline.

I have included my preferred vimbundles as a submodule.  Upon running ./install, it will init and update all vimbundles as well.

## Preferred Setup:

1. `git clone https://github.com/timcmartin/strap`
2. edit `bin/strap.sh` to have the correct Github credentials.
3. Run `bash bin/strap.sh`

Strap has been forked from the original repo and modified to work with Dotbot.

## Secondary Setup:

`git clone --recursive https://github.com/timcmartin/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./install`

1. git clone this project

```
  git clone https://github.com/timcmartin/dotfiles.git ~/Dotfiles
```

2. Change into the ~/.dotfiles directory and run ./install

```
  cd ~/Dotfiles
  scripts/./install
```

Dotbot will update the submodules and create the requisite symlinks.

## Editing:

To edit the functionality, of Dotbot, edit the `install.conf.yaml` file.

See [Dotbot](https://github.com/anishathalye/dotbot) for more information and examples.

## Other Things to Install

* iTerm2
* Node.js
* oh-my-zsh
* Alfred
* Bartender
* iStat menus
* Dropbox
* Slack
* AnyConnect
* Keeping You Awake
* Muzzle
* Fork
* 1Password
* AWS config

### Tmux Plugin Manager:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
