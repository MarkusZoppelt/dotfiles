HOMEBREW_PREFIX="$(brew --prefix)"

# Setup aliases ###############################################################
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'

if type lsd &> /dev/null; then
  alias ls="lsd"
  alias ll="lsd -l"
fi

if type nvim &> /dev/null; then
  alias vim=nvim
  export EDITOR='nvim'
fi

if type lazygit &> /dev/null; then
  alias lg=lazygit
fi

# General settings ############################################################
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select=1
setopt COMPLETE_ALIASES
setopt autocd
unsetopt BEEP

bindkey -s ^f "tmux-sessionizer\n"

if [ -d "$HOME/go/bin" ]; then
	export PATH="$PATH:$HOME/go/bin"
fi

if [ -d "$HOME/.local/bin" ]; then
	export PATH="$PATH:$HOME/.local/bin"
fi

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
case $OSTYPE in
  linux*)
	if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
		PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
	fi
	[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2>/dev/null
	source "$HOME/.fzf/shell/key-bindings.zsh"
  ;;
  darwin*)
	if [[ ! "$PATH" == *$HOMEBREW_PREFIX/opt/fzf/bin* ]]; then
		PATH="${PATH:+${PATH}:}$HOMEBREW_PREFIX/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" 2>/dev/null
	source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  ;;
esac

# Setup completions & autosuggestions #########################################
case $OSTYPE in
  linux*)
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
  darwin*)
    source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
esac
fpath=($HOME/.local/share/zsh/completions $fpath)

# Setup YubiKey Agent #########################################################
case $OSTYPE in
  darwin*)
    export SSH_AUTH_SOCK="$HOMEBREW_PREFIX/var/run/yubikey-agent.sock"
  ;;
esac

# Setup asdf ##################################################################
if type asdf &> /dev/null; then
  . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
  jh() {
    if [ -e "$HOME/.asdf/plugins/java/set-java-home.zsh" ]; then
      . $HOME/.asdf/plugins/java/set-java-home.zsh
    fi
  }
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
