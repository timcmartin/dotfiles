# Convenience Commands
alias chrome="google-chrome-stable --password-store=basic"
alias clearcache='rake tmp:cache:clear'
alias clearlogs='rake log:clear'
alias cypress-candidate-getty="yarn candidate:headless --spec cypress/integration/gi_spec.js"
alias cypress-candidate-istock="yarn candidate:headless --spec cypress/integration/istock_spec.js"
alias cypress-candidate="yarn candidate:headless"
alias cypress-dev-getty="yarn development:headless --spec cypress/integration/gi_spec.js"
alias cypress-dev-istock="yarn development:headless --spec cypress/integration/istock_spec.js"
alias cypress-dev="yarn development:headless"
alias cypress-stage-gix="yarn staging-ca:headless --spec cypress/integration/gi_gix_spec.js"
alias cypress-stage-getty="yarn staging-ca:headless --spec cypress/integration/gi_spec.js"
alias cypress-stage-istock="yarn staging-ca:headless --spec cypress/integration/istock_spec.js"
alias cypress-stage="yarn staging-ca:headless"
alias findpg='ps -ax | grep -i postgres'
alias gidocker="cd ~/src/getty/unisporkal/gi_proxy && ./runDocker.sh -b"
alias gir="bundle exec rails s"
alias gilog="tail -f log/development.log | ag -A 2 -Q '**********'"
alias gidynamo='docker run -p 8000:8000 curated-set-dynamo -dbPath /data/'
alias gidynamoadmin='dynamodb-admin'
alias hosts='sudo vim /etc/hosts'
alias iptables="sudo iptables -L --line-numbers"
alias iptablesdrop="sudo iptables -D ciscovpn "
alias mux='tmuxinator'
alias t='todo.sh -d ~/.todo.cfg'
alias v.='vim .'
alias v='vim'
alias vimrc='vim ~/.vimrc'
alias vimupdate='cd ~/.vimbundles;find . -maxdepth 1 -type d -exec sh -c "'"(cd {} && git pull)"'" "'";"'"'
alias vimwork='vim -O ~/Dropbox/vimwiki/getty/index.wiki ~/Dropbox/vimwiki/getty/diary/diary.wiki'

# Bash Commands
alias bashedit='vim ~/.bash_aliases'
alias callme='sudo su -'
alias m.='mate .'
alias m=mate
alias please=sudo
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias rebash='START_DIR=`pwd`;cd ..;source ~/.bash_aliases;cd $START_DIR; c; l'

# Code Aliases
alias asset_detail='cd $HOME/src/getty/unisporkal/asset_detail'
alias cabin='cd $HOME/src/personal/cabin-monitor'
alias devwork="vim $HOME/src/personal/workdev/index.html"
alias dotfiles='cd $HOME/Dotfiles'
alias mycode='cd $HOME/src/personal'
alias recipes='cd $HOME/Dropbox/vimwiki/recipes/book'
alias src='cd ~/src'
alias unisporkal='cd $HOME/src/getty/unisporkal'
alias automation='cd $HOME/src/getty/automation'
alias workdev='cd $HOME/src/personal/workdev'
alias wurstwings='cd $HOME/src/personal/wurstwings'
#alias wwredis='redis-server /usr/local/etc/redis.conf'

# Pickler Commands
alias curtest='cr cucumber FEATURE=$CURTEST'
alias curpush='pickler push $CURTEST'
alias curpull='pickler pull $CURTEST'
alias curstart='pickler start $CURTEST'
alias curfinish='pickler finish $CURTEST'
alias curdeliver='pickler deliver $CURTEST'
alias curspec='rspec $CURSPEC'

# Directory Navigation
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

# Git Commands
alias g='git'
alias gac='git add . -A && git commit'
alias gadd='git add .'
alias gap='git add -p'
alias gaddp='git add -p'
alias gbr='git branch'
alias gbra='git branch -a'
alias gc='git commit'
alias gci='git commit -am'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gdel='git add -u'
alias gdf='clear; git diff -a -w'
alias gf='git flow'
alias gfull='clear; git status; git add .; git add -u; echo "****************"; git status; git ci -am'
alias gl='git pull'
alias glog='clear; git log'
alias gfl='git log -u'
alias gwho='git shortlog -s --'
alias gme='git merge --no-ff'
alias gmv='git mv'
alias gp='git push'
alias gpull='git pull'
alias gpush='git push'
alias greset='git reset --hard HEAD && git clean -fd'
alias grm='git rm'
alias gst='git status'
alias gtr="git tr"
alias gtree="git tree"
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"
alias viuntracked='vi $(git ls-files -o -X .gitignore)'
alias glastfive="git reflog | egrep -io \"moving from ([^[:space:]]+)\" | awk '{ print $3 }' | head -n5"
alias updatesubs='git submodule foreach --recursive git fetch'
alias gbranchdate="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"

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
alias railsservers='lsof -wni tcp:5000'

# Bundle Commands
#alias be='bundle exec'
#alias becr='c; yn bundle exec rake'
#alias berake='bundle exec rake'

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

[ ! -f "$HOME/.bash_aliases.local" ] || . "$HOME/.bash_aliases.local"
