export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

export NPM_CONFIG_PREFIX="$HOME/.npm"
export PATH="$HOME/.npm/bin:$PATH"
