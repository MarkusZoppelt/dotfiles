if type brew &> /dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"
fi

# Setup aliases ###############################################################
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias ls='ls -F --color=always'
alias ll='ls -l'
alias lg=lazygit

if type nvim &> /dev/null; then
  alias vim=nvim
  export EDITOR='nvim'
fi

# General settings ############################################################
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select=1
setopt COMPLETE_ALIASES
setopt autocd
unsetopt BEEP

bindkey -s ^a "tmux a\n"
bindkey -s ^f "tmux-sessionizer\n"

[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# History #####################################################################
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999999
SAVEHIST=9999999
setopt INC_APPEND_HISTORY   # immediately append the history file
setopt EXTENDED_HISTORY     # record timestamp in history
setopt HIST_IGNORE_DUPS     # don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # ignore all duplicate entries
setopt HIST_FIND_NO_DUPS    # do not display a line previously found
setopt HIST_IGNORE_SPACE    # ignore commands that start with space
setopt HIST_SAVE_NO_DUPS    # don't write duplicate entries
setopt SHARE_HISTORY        # share history between sessions
bindkey '^R' history-incremental-pattern-search-backward # fzf fallback

# Setup fzf ###################################################################
if type fzf &> /dev/null; then
    eval "$(fzf --zsh)"
else
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# Setup completions & autosuggestions #########################################
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($HOME/.local/share/zsh/completions $fpath)

# Setup YubiKey Agent #########################################################
case $OSTYPE in
  linux*)
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"
  ;;
  darwin*)
    export SSH_AUTH_SOCK="$HOMEBREW_PREFIX/var/run/yubikey-agent.sock"
  ;;
esac

# Setup Go ####################################################################
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Setup mise ##################################################################
if type mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

# Setup Google Cloud SDK ######################################################
if [ -d "$HOME/.gcloud/sdk" ]; then
    . "$HOME/.gcloud/sdk/path.zsh.inc"
    . "$HOME/.gcloud/sdk/completion.zsh.inc"
fi

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Setup LLVM 16 (to work with cifuzz) #########################################
if [ -d /opt/homebrew/opt/llvm@16 ]; then
  export PATH="/opt/homebrew/opt/llvm@16/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm@16/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm@16/include"
fi
