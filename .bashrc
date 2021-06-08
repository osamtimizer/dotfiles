# exports definition
export LANG=en_US.UTF-8

#less settings
export PAGER=less
export LESS=' -g -i -M -R -S -W -z-4 -x4'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

#rbenv 
eval "$(rbenv init -)"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export GOPATH="$HOME/go"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$GOPATH/bin

function ghql() {
  local selected_file=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
    fi
  fi
}

# alias
alias g='git'
alias gmbd='git branch --merged master | grep -vE "^\*|master$" | xargs -I % git branch -d %'
alias hl='temp=$(cat ~/.bash_history | peco); { echo "$temp" | pbcopy ; }'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias dcrabe='docker-compose run --rm app bundle exec'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias be='bundle exec'
alias f-g='find ./ -type f -print | xargs grep '
alias src='source ~/.bash_profile'

# binds
bind -x '"\C-g": ghql'
bind -x '"\C-r": hl'

# bash history
export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=530000

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# git-completion
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

function length()
{
  echo -n ${#1}
}

function init-prompt-git-branch()
{
  git symbolic-ref HEAD 2>/dev/null >/dev/null &&
  echo "($(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///'))"
}

if which git 2>/dev/null >/dev/null
then
  export PS1_GIT_BRANCH='\[\e[$[COLUMNS]D\]\[\e[1;31m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]$(init-prompt-git-branch)\[\e[$[COLUMNS]D\]\[\e[0m\]'
else
  export PS1_GIT_BRANCH=
fi

export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\[\e[36;1m\]\t \[\e[0m\]\$ "

# secret settings
source $HOME/.bashrc.secret

# openssl settings
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
source "$HOME/.cargo/env"
