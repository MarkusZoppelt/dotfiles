# Environment variables for all Zsh sessions

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Rust toolchain
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Local binaries
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Go environment
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Node.js global packages
export NPM_CONFIG_PREFIX="$HOME/.npm"
export PATH="$HOME/.npm/bin:$PATH"
