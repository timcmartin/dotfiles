# Convenience Commands
alias awslocal="export AWS_PROFILE=local"
alias awssand='export AWS_PROFILE=oktad && oktad -p getty-sandbox -t sandbox -w'
alias awscand='oktad -p getty-nonprod -t okta -w'
alias chrome="google-chrome-stable --password-store=basic"
alias clearcache='rake tmp:cache:clear'
alias clearlogs='rake log:clear'
alias ciucands='ciu; g co custom-environment; RAILS_ENV=devcand bundle exec rails s'
alias ciucandc='ciu; g co custom-environment; RAILS_ENV=devcand rails c'
alias ciuprods='ciu; g co custom-environment; RAILS_ENV=kdevprod bundle exec rails s'
alias ciuprodc='ciu; g co custom-environment; RAILS_ENV=devprod rails c'
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
alias cypress-stage-vpn="yarn staging:headless"
alias cypress-stage-vpn-getty="yarn staging:headless --spec cypress/integration/gi_spec.js"
alias cypress-stage-vpn-istock="yarn staging:headless --spec cypress/integration/istock_spec.js"
alias findpg='ps -ax | grep -i postgres'
alias giproxy="cd ~/src/getty/unisporkal/gi_proxy && ./runLocal.sh | lolcat"
alias gip="./runLocal.sh | lolcat"
alias gfi='g fi'
# add current branch to fi
alias fiadd='g fi -a'
# Misc Admin
alias giproxy-a="cd ~/src/getty/unisporkal/gi_proxy; git checkout uni_admin; git pull --rebase; ./runLocal.sh | lolcat"
alias gipa="cd ~/src/getty/unisporkal/gi_proxy; git checkout uni_admin; ./runLocal.sh | lolcat"
alias watchlint="esw -w --changed app/javascript/react --ext .js,.jsx --color"
alias watchjest="yarn jest --watch"
alias watchjestdb="yarn jest-debug --watch"
# Home
alias giproxy-wfh="cd ~/src/getty/unisporkal/gi_proxy && git checkout wfh && ./runLocal.sh -b | lolcat"
alias gipw="cd ~/src/getty/unisporkal/gi_proxy && git checkout wfh && ./runLocal.sh | lolcat"
alias giproxy-cabin="cd ~/src/getty/unisporkal/gi_proxy && git checkout cabin && ./runLocal.sh -b | lolcat"
alias gir="bundle exec rails s"
alias girs="bundle exec rails s 1>/dev/null"
alias giw="yarn dev"
alias giwp="./bin/webpack-dev-server"
alias gilog="tail -f log/development.log | ag -A 2 -Q '**********'"
alias gidynamoup="cd $HOME/src/getty/gi-local-dynamo && bin/start"
alias gidynamostop="cd $HOME/src/getty/gi-local-dynamo && bin/stop"
alias drestart="cd $HOME/src/getty/gi-local-dynamo && bin/stop && bin/start"
alias gicns='bundle exec rackup --host 0.0.0.0 --port 3108'
alias giguard='find . -type f -name "*.rb" | entr -c -p bundle exec rspec spec --format documentation'
# OLD when working on CNS
# alias uni_pre_update='proxy && git checkout master | cns && git checkout master && gilock | service_client && git checkout master'
# alias uni_post_update='proxy && git checkout wfh && g rebase master | cns && git checkout - | service_client && git checkout wfh && g rebase master | unisporkal'
alias uni_pre_update='proxy && git checkout master | uniadmin && git checkout master && gilock'
alias uni_post_update='proxy && git checkout uni_admin && g rebase master | uniadmin && git checkout - | unisporkal'
alias uni_pull='uni_pre_update && uni update && uni pull && uni_post_update'
alias uni_update='uni_pre_update && uni update && uni_post_update'
alias uni_gems='uni pull -g'
alias dockerclean='docker rm $(docker ps -a -f status=exited -q)'
alias listpackages='ls -l node_modules | grep ^l'
alias listunipackages='ls -l node_modules/@unisporkal | grep ^l'
alias rebundle='gem install --default -v 1.17.3 bundler && bundle'
alias readmin='gem install --default -v 1.17.3 bundler && bundle && giwp'

# Console for CNS
alias cnsc='bundle exec pry -I. -r app.rb'
# PID for CNS (when freezes)
alias cnspid='lsof -wni tcp:3108'
# PID for landing (when freezes)
alias landingpid='lsof -wni tcp:3106'
# PID for misc-admin (when freezes)
alias miscpid='lsof -wni tcp:3112'
# PID for purchase (when freezes)
alias purchasepid='lsof -wni tcp:3102'
# PID for sign_in (when freezes)
alias signinpid='lsof -wni tcp:3101'
# kill apps
alias kill_cns='kill -9 $(cnspid -t)'
alias kill_landing='kill -9 $(landingpid -t)'
alias kill_misc='kill -9 $(miscpid -t)'
alias kill_purchase='kill -9 $(purchasepid -t)'
alias kill_proxy='docker stop hap'
alias giawslocal="export AWS_PROFILE=local"
alias gilock='g co Gemfile.lock'
alias yarnlock='g co yarn.lock'
alias gimerge='git merge --no-ff'
alias gifixtures='be rake fixtures'
alias gitestfixtures='RAILS_ENV=test be rake fixtures'
alias gikarma='yarn test'
alias gikarmabrowser='yarn debug-test'
alias givim="nvim -O $HOME/Dropbox/vimwiki/getty/diary/diary.wiki $HOME/Dropbox/vimwiki/getty/index.wiki"
alias hosts='sudo vim /etc/hosts'
alias iptables="sudo iptables -L --line-numbers"
alias iptablesdrop="sudo iptables -D ciscovpn "
alias mux='tmuxinator'
alias t='todo.sh -d ~/.todo.cfg'
alias v.='vim .'
alias v='vim'
alias vimrc='vim ~/.vimrc'
alias vimupdate='cd ~/.vimbundles;find . -maxdepth 1 -type d -exec sh -c "'"(cd {} && git pull)"'" "'";"'"'
# ^M FIX
alias caretm='stty sane'
# Cleanup vim backup dir not used in past 7 days
alias cleanvim="find ~/.vimbackupdir -type f -name '*.*' -not \( -atime 0 -or -atime 1 -or -atime 2 -or -atime 3 -or -atime 4 -or -atime 5 -or -atime 6 \) -delete"
# Clear You've got mail
alias cleanmail="sudo cat /dev/null > /var/mail/tmartin"
# Source TMUX conf
alias sourcetmux="tmux source-file ~/.tmux.conf"
# List Yarn Links
alias yarnlink="ls -l ~/.config/yarn/link"
# Open Review App from within directory & branch
alias cb='git rev-parse --abbrev-ref HEAD'
alias review='open "https://$(cb).review-istockphoto.com"; open "https://$(cb).review-gettyimages.com"';

# Local Webserver
# Run in the directory you want to start it in, localhost:8000
alias webserver='python -m SimpleHTTPServer 8000'

# Bash Commands
alias aliasedit='vim ~/.bash_aliases'
alias editalias='vim ~/.bash_aliases'
alias callme='sudo su -'
alias m.='mate .'
alias m=mate
alias please=sudo
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias rebash='START_DIR=`pwd`;cd ..;source ~/.bash_aliases;cd $START_DIR; c; l'
alias flushdns="say 'flushing D N S';sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say 'awwwww yeeeyiah'"

# Code Aliases
## Getty
alias account='cd $HOME/src/getty/unisporkal/account'
alias adp='cd $HOME/src/getty/unisporkal/asset_detail'
alias automation='cd $HOME/src/getty/automation'
alias ciu='cd $HOME/src/getty/unisporkal/curated-image-uploader'
alias cns='cd $HOME/src/getty/unisporkal/customer-notifications'
alias collab='cd $HOME/src/getty/unisporkal/collaboration'
alias consul='cd $HOME/src/getty/unisporkal/gems/consul_client'
alias cypress='cd $HOME/src/getty/automation'
alias engine='cd $HOME/src/getty/unisporkal/gems/unisporkal_engine'
alias gidocs='cd $HOME/src/getty/unisporkal/docs'
alias landing='cd $HOME/src/getty/unisporkal/landing'
alias misc_admin='cd $HOME/src/getty/unisporkal/misc_admin'
alias uniadmin='cd $HOME/src/getty/unisporkal/misc_admin'
alias packages='cd $HOME/src/getty/unisporkal/packages'
alias proxy='cd $HOME/src/getty/unisporkal/gi_proxy'
alias purchase='cd $HOME/src/getty/unisporkal/purchase'
alias service_client='cd $HOME/src/getty/unisporkal/gems/service_client'
alias sign_in='cd $HOME/src/getty/unisporkal/sign_in'
alias srp='cd $HOME/src/getty/unisporkal/search'
alias styles='cd $HOME/src/getty/unisporkal/gems/unisporkal_styles'
alias unisporkal='cd $HOME/src/getty/unisporkal'
alias uni-old='cd $HOME/src/unisporkal-old'
## Personal
alias cabin='cd $HOME/src/personal/cabin-monitor'
alias devwork="vim $HOME/src/personal/workdev/index.html"
alias dotfiles='cd $HOME/Dotfiles'
alias documents='cd $HOME/Documents'
alias dropbox='cd $HOME/dropbox'
alias mycode='cd $HOME/src/personal'
alias recipes='cd $HOME/src/personal/recipes'
alias src='cd ~/src'
alias vimwiki='cd $HOME/Dropbox/vimwiki'
alias workdev='cd $HOME/src/personal/workdev'
alias wurstwings='cd $HOME/src/personal/wurstwings'

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

# Git Commands -> See also ~/.oh-my-zsh/plugins/git/git.plugin.zsh
alias gac='git add . -A && git commit'
# Notes
# gap = gapa now (oh-my-zsh)
# gl = git pull
# ggp = git push
# gpristine = reset && clean
alias gpull='git pull'
alias gpush='git push'
alias greset='git reset --hard HEAD && git clean -fd'
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"
alias glastfive="git reflog | egrep -io \"moving from ([^[:space:]]+)\" | awk '{ print $3 }' | head -n5"
# git branches for all subdirs
alias brall='for dir in $(ls -d */);do (cd $dir && [ -d .git ] && echo "$dir [$(git rev-parse --abbrev-ref HEAD)]") || git rev-parse --git-dir 2> /dev/null; done'
alias brm="unisporkal && brall | grep -v 'master' | grep -v '\[\]' && cd gems && brall | grep -v 'master' | grep -v '\[\]' && unisporkal"
# clean all merged branches
alias git_clean_merged='git checkout master | git branch --merged| egrep -v "(^\*|master|fi)" | xargs git branch -d'
alias gbranchdate="git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads"
alias gupdatedirs="find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;"
alias updatesubs='git submodule foreach --recursive git fetch'
alias viuntracked='vi $(git ls-files -o -X .gitignore)'
# Empty commit to force a rebuild
alias gec='git commit --allow-empty -m'
alias gtb='git commit --allow-empty - m "Trigger Build"'

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

# Silver Searcher
alias ag='ag --path-to-ignore ~/.ignore'
alias Ag='ag --path-to-ignore ~/.ignore'

# Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Node Typescript Compile
alias tsc="node_modules/.bin/tsc"
alias nsi="node ./dist/index.js"

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

