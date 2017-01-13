# Dotfiles

This repository borrows heavily from [jcarley/dotmatrix](https://github.com/jcarley/dotmatrix),
but was tweaked in 2017 for use with [Strap](http://mikemcquaid.com/2016/06/15/replacing-boxen/) and [Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all).

This config makes use of powerline and tmux-powerline.

It also references a private bitbucket repo that contains private_dotfiles.

I have included my preferred vimbundles as a submodule.

Might have to manually do ohmyzsh -> have added something to setup script that might work.

## TODO:
- [O] Installation
  - [X] tmux
  - [X] tmuxinator
  - [ ] Exhuberant Ctags
  - [X] Vim
  - [ ] Powerline Fonts
  - [ ] Projects
  - [X] zsh
  - [X] ohmyzsh
  - [X] postgresql
  - [X] evernote
- [ ] Script - locations
  - [ ] crypt_config.vim -> dotfiles_private/crypt_congfig.vim
  - [ ] properties/local.update_dotfiles.plist -> ~/Library/LaunchAgents/local.update_dotfiles.plist
- [ ] Script - should not symlink
  - [ ] VITUNES.md
  - [ ] tmux-theme
  - [ ] tim.sh
  - [ ] git-completion.bash
- [ ] Script - ensures directory exists
  - [ ] vim
  - [ ] vimbackupdir
  - [ ] zsh
