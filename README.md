# Dotfiles

This repository borrows heavily from [jcarley/dotmatrix](https://github.com/jcarley/dotmatrix),
but was tweaked in 2017 for use with [Strap](http://mikemcquaid.com/2016/06/15/replacing-boxen/) and [Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all).

This config makes use of powerline and tmux-powerline.

It also references a private bitbucket repo that contains private_dotfiles.

I have included my preferred vimbundles as a submodule.

Might have to manually do ohmyzsh -> have added something to setup script that might work.

## TODO:
- [o] Installation
  - [X] tmux
  - [X] tmuxinator
  - [ ] Exhuberant Ctags
  - [X] Vim
  - [X] Powerline Fonts
  - [ ] Projects
  - [X] zsh
  - [X] ohmyzsh
  - [X] postgresql
  - [X] evernote
  - [X] http://www.audacityteam.org/
  - [ ] Bartender2
  - [ ] Alfred
  - [ ] Skitch
  - [ ] GarageBand
- [X] Script - locations
  - [X] crypt_config.vim -> dotfiles_private/crypt_congfig.vim
  - [X] properties/local.update_dotfiles.plist -> ~/Library/LaunchAgents/local.update_dotfiles.plist
- [.] Script - should not symlink
  - [X] VITUNES.md
  - [ ] tmux-theme
  - [ ] tim.sh
  - [ ] git-completion.bash
- [X] Script - ensures directory exists
  - [X] vim
  - [X] vimbackupdir
  - [X] zsh
