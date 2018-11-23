# 日本語
export LANG=ja_JP.UTF-8

# nodebrew
export NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=$PATH:$NODEBREW_HOME/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# alias
alias ga='git add .'
alias gcm='git commit -m'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
