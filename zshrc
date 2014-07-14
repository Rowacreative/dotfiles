ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew bundler composer gem node npm rbenv rsync ruby rails textmate hk)

source $ZSH/oh-my-zsh.sh

# Load keys into keychain if keychain file exists
if type keychain > /dev/null
then
  keychain id_rsa
  source ~/.keychain/`uname -n`-sh
fi

# DNS Flush
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# SSH Auto CD
alias ssh='env SSH_PWD="$PWD" command ssh'

# Shortcut to editing local git config
alias vgit='vim .git/config'

alias r='rails'
alias h='heroku'

alias rapp='rails new --skip-gemfile --skip-test-unit --database=mysql -m https://raw.githubusercontent.com/fetch/rails-templates/master/default.rb'

alias opendev='open http://$(basename $PWD).dev'

# s3cmd aliases for different s3 accounts
alias s3fetch='s3cmd -c ~/.s3cfg-fetch'

setopt complete_aliases

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

# RBENV
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# Git
#export PATH=/usr/local/git/bin:$PATH

# HUB
# export GITHUB_USER=""
# eval "$(hub alias -s)"

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads NVM

# Grunt
eval "$(grunt --completion=zsh)"
