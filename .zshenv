source ~/.zplug/init.zsh
source ~/.zshenv.secret

export GOPATH=~/go
export GOBIN=$GOPATH/bin
export GHQ_HOME=~/ghq
export FLUTTER_ROOT=~/ghq/github.com/flutter/flutter
export HELM_PLUGINS=~/Library/helm/plugins
source "$HOME/.cargo/env"
export FLUTTER_GIT_URL='ssh://git@github.com/flutter/flutter.git'
. "$HOME/.cargo/env"
