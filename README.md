# Dotfiles

This repository borrows heavily from [jcarley/dotmatrix](https://github.com/jcarley/dotmatrix),
but was tweaked for use with [Dotbot](https://github.com/anishathalye/dotbot).

This config makes use of powerline and tmux-powerline.

I have included my preferred vimbundles as a submodule.  Upon running ./install, it will init and update all vimbundles as well.

## Setup:

`git clone https://github.com/timcmartin/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./install`

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
