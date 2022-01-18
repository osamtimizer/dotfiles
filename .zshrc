export LANG=en_US.UTF-8

autoload -U compinit
compinit

source ~/.zshrc.secret

# promptinitを使う場合はこちらを読み込む
# 利用可能なpromptの設定を見る
# $ prompt -l
# promptを設定する
# $ prompt [prompt名]
autoload -U promptinit
promptinit

# setopts
setopt auto_list
setopt auto_menu

# promptを独自で変更
PROMPT='%m:%F{green}%c%f %n%# '

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=2000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=530000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks  
# 古いコマンドと同じものは無視 
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history

# alias
alias g='git'
alias gp='gti push'
alias gmbd='git branch --merged master | grep -vE "^\*|master$" | xargs -I % git branch -d %'
alias hl='temp=$(cat ~/.bash_history | peco); { echo "$temp" | pbcopy ; }'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias dcrabe='docker-compose run --rm app bundle exec'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias be='bundle exec'
alias f-g='find ./ -type f -print | xargs grep '

# zplug
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# ヒストリの補完を強化する
zplug "zsh-users/zsh-history-substring-search", defer:3

# インストールしてないプラグインはインストール
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# flutter
export PATH="$HOME/ghq/github.com/flutter/flutter/bin:$PATH"

# Android SDK
export PATH=$PATH:/$HOME/Library/Android/sdk/platform-tools

# starship
eval "$(starship init zsh)"

# peco functions
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

# zle
zle -N peco-src
zle -N peco-history-selection

# bind keys
bindkey '^R' peco-history-selection
bindkey '^g' peco-src

# kubectl
source <(kubectl completion zsh)
alias k=kubectl
complete -o default -F __start_kubectl k

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"

# binutils
export PATH="/usr/local/opt/binutils/bin:$PATH"

export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# ruby
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

# gcloud
export PATH="$HOME/dev/google-cloud-sdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

# https://github.com/superbrothers/zsh-kubectl-prompt
autoload -U colors; colors
source $HOME/ghq/github.com/superbrothers/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[$PCOLOR]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
