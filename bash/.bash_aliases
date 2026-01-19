# Common Convenience Commands
alias chrome="google-chrome-stable --password-store=basic"
alias findpg='ps -ax | grep -i postgres'

# Git shortcuts (common)
alias gfi='g fi'
alias fiadd='g fi -a'
alias gac='git add . -A && git commit'
alias gbranchdate="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"
alias gec='git commit --allow-empty -m'
alias glastfive="git reflog | egrep -io \"moving from ([^[:space:]]+)\" | awk '{ print $3 }' | head -n5"
alias gpull='git pull'
alias gpush='git push'
alias greset='git reset --hard HEAD && git clean -fd'
alias gsquash='git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))'
alias gtb='git commit --allow-empty - m "Trigger Build"'
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"
alias gupdatedirs="find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;"
alias updatesubs='git submodule foreach --recursive git fetch'
alias viuntracked='vi $(git ls-files -o -X .gitignore)'
alias git_clean_merged='git checkout master | git branch --merged| egrep -v "(^\*|master|fi)" | xargs git branch -d'
alias git-repos='git-repos.sh'

# Development tools
alias watchlint="esw -w --changed app/javascript/react --ext .js,.jsx --color"
alias yj="yarn jest"
alias yjd="yarn jest-debug"
alias wyjd="yarn jest-debug --watch"
alias dockerclean='docker rm $(docker ps -a -f status=exited -q)'
alias listpackages='ls -l node_modules | grep ^l'
alias listunipackages='ls -l node_modules/@unisporkal | grep ^l'
alias rebundle='gem install --default -v 1.17.3 bundler && bundle'
alias readmin='gem install --default -v 1.17.3 bundler && bundle && giwp'
alias yarnlock='g co yarn.lock'
alias yarnlink="ls -l ~/.config/yarn/link"

# System administration
alias hosts='sudo nvim /etc/hosts'
alias iptables="sudo iptables -L --line-numbers"
alias iptablesdrop="sudo iptables -D ciscovpn "
alias ka='kill -9'
alias kill_proxy='docker stop hap'
alias mux='tmuxinator'
alias sourcetmux="tmux source-file ~/.tmux.conf"
alias please=sudo
alias callme='sudo su -'

# Todo
alias t='todo.sh -d ~/.todo.cfg'

# Vim => nvim
alias v.='nvim .'
alias v='nvim'
alias cleanvim="find ~/.vimbackupdir -type f -name '*.*' -not \( -atime 0 -or -atime 1 -or -atime 2 -or -atime 3 -or -atime 4 -or -atime 5 -or -atime 6 \) -delete"

alias caretm='stty sane'
alias cleanmail="sudo cat /dev/null > /var/mail/tmartin"

# Useful shortcuts
alias cb='git rev-parse --abbrev-ref HEAD'
alias review='open "https://$(cb).review-istockphoto.com"; open "https://$(cb).review-gettyimages.com"'
alias webserver='python -m SimpleHTTPServer 8000'
alias editalias='nvim ~/.bash_aliases'
alias m.='mate .'
alias m=mate
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias rebash='START_DIR=`pwd`;cd ..;source ~/.bash_aliases;cd $START_DIR; c; l'
alias flushdns="say 'flushing D N S';sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say 'awwwww yeeeyiah'"

# Gem Commands
alias audit='gem list'
alias buy='gem install'
alias polish='gem update'
alias price='gem list -r'
alias recut='gem edit -e mvim'
alias sell='gem uninstall'
alias shop='gem search -r'
alias surplus='gem list | ack ","'

# Rails Commands
alias cr='c; yn rake'
alias deploy='cap_deploy.sh'
alias mysqlup='mysql.server start'
alias mysqldown='mysql.server stop'
alias pgup='pg_ctl -w -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias redisup='redis-server ~/Dotfiles/redis.conf'
alias redistestup='redis-server ~/Dotfiles/redistest.conf'
alias redisstop='redis-cli shutdown'
alias rakedbtestkill='RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate'
alias rakedbreset='rake db:migrate:reset'
alias rakedbinit='rake db:drop db:create db:migrate'
alias rb='ruby'
alias testenv='RAILS_ENV=test'
alias pryc='pry -r ./config/environment'
alias rsff='be rspec spec --fail-fast --format documentation'
alias railsservers='lsof -wni tcp:5000'

# Node Typescript Compile
alias tsc="node_modules/.bin/tsc"
alias nsi="node ./dist/index.js"

# Rails helper functions
function rails_command {
  local cmd=$1
  shift
  if [ -e script/rails ]; then
    echo "script/rails $cmd \"$@\""
    script/rails $cmd "$@"
  else
    echo "script/$cmd \"$@\""
    script/$cmd "$@"
  fi
}
function ss {
  rails_command "server" "$@"
}
function sc {
  rails_command "console" "$@"
}
function sg {
  rails_command "generate" "$@"
}
function sr {
  rails_command "runner" "$@"
}
function sdb {
  rails_command "dbconsole" "$@"
}

# Bundle Commands
function bundle_command {
  local cmd=$1
  shift
  if [ -e script/rails ]; then
    echo "bundle exec script/rails $cmd \"$@\""
    script/rails $cmd "$@"
  else
    echo "bundle exec script/$cmd \"$@\""
    script/$cmd "$@"
  fi
}
function bess {
  bundle_command "server" "$@"
}
function besc {
  bundle_command "console" "$@"
}
function besg {
  bundle_command "generate" "$@"
}
function besr {
  bundle_command "runner" "$@"
}
function besdb {
  bundle_command "dbconsole" "$@"
}

# Directory Navigation - Common
alias dotfiles='cd $DOTFILES_DIR'
alias documents='cd $HOME/Documents'
alias dropbox='cd $DROPBOX_DIR'
alias src='cd ~/src'
alias vimwiki='cd $DROPBOX_DIR/vimwiki'
alias uni-old='cd $HOME/src/unisporkal-old'
alias nvim-sessions='cd $HOME/.local/share/nvim/sessions'
alias tmux-sessions='cd $HOME/.local/share/tmux/resurrect'
alias app-cache='cd $HOME/.cache'

# Directory shortcuts
alias ...='cd ../..'
alias ..='cd ..'
alias ::='cd ../..'
alias :::='cd ../../..'
alias ::::='cd ../../../..'
alias :::::='cd ../../../../..'
alias ~='cd ~'
alias b='cd -'
alias c=clear
alias d='ls -bF'
alias l='exa -a --long --header --git'
alias la='exa -a'
alias ll='exa -l --git'
alias ls='ls -G'
alias lsa='ls -lah'

# Load context-specific aliases (work/personal)
if [ -f "$HOME/.dotfiles/bash/.bash_aliases.work" ]; then
  source "$HOME/.dotfiles/bash/.bash_aliases.work"
fi

if [ -f "$HOME/.dotfiles/bash/.bash_aliases.personal" ]; then
  source "$HOME/.dotfiles/bash/.bash_aliases.personal"
fi

# Load machine-specific local aliases (not version controlled)
[ ! -f "$HOME/.bash_aliases.local" ] || . "$HOME/.bash_aliases.local"
