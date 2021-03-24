source ~/.zplug/init.zsh
source ~/.zshenv.secret

export GOPATH=~/go
export GHQ_HOME=~/ghq
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export FLUTTER_ROOT=~/ghq/github.com/flutter/flutter
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# ruby
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

# gcloud
export PATH="$HOME/dev/google-cloud-sdk/bin:$PATH"
