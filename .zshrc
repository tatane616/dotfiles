# Language
export LANG=en_US.UTF-8

# nodebrew
export PATH=/usr/local/var/nodebrew/current/bin:$PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE=github.com/blue-agency

# postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# alias
alias git="hub"
alias ll='ls -a'
alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias dws-chrome='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'
alias br-clean="git br --merged | grep -v master | xargs git br -D"
alias getkt="grpcurl -plaintext -d '{\"key\":\"eyJhbGciOiJFUzUxMiIsImtpZCI6IjIzODk0NzFkYjc1NWRlODM1Y2E2N2Q0OWEwNTE4ZjgwMDAzZjQ4ZCJ9.eyJleHAiOjE4ODc1OTk2OTYsInN1YiI6Il9kZXZlbG9wZXIifQ.AGnE_0r-VF0nM2Ls71PWGUuflNM6Td0T-B7faZFrA27_pg1A2y7YfVvpFjEM11vkQeBxAlFv0m4naxd22cjLsCH4AUIxJQsmpWRxC5JM5fto3QIzh7V-CO2gCze1KCg_mqYGiTbkLqCHlKKK1WB1TSk33UbwDrQ_6Lq4_oOQ6ohWylLO\"}' -import-path=$GOPATH/src/github.com/blue-agency/proton/proto -import-path=$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis -proto api_token_service.proto kyber.local.k8s.blag.cc:20080 proton.APITokenService/GetToken | jq -r .token"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# Editors
export EDITOR='vim'
export VISUAL='vim'

# GPG
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon)
fi

# direnv
eval "$(direnv hook zsh)"
