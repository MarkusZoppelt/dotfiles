if [ -x "$(command -v pkgx)" ]; then
    source <(pkgx --shellcode)
fi

BREW_PREFIX=$(brew --prefix)

# Setup aliases ###############################################################
alias ls="lsd"
alias ll="lsd -l"
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias vim=nvim
alias lg=lazygit

# General settings ############################################################
export EDITOR='nvim'
autoload -U compinit
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
bindkey '^R' history-incremental-pattern-search-backward

# Setup Node with fnm #########################################################
if [ -x "$(command -v fnm)" ]; then
	eval "$(fnm env --use-on-cd)"
fi

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
	if [[ ! "$PATH" == *$BREW_PREFIX/opt/fzf/bin* ]]; then
		PATH="${PATH:+${PATH}:}$BREW_PREFIX/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "$BREW_PREFIX/opt/fzf/shell/completion.zsh" 2>/dev/null
	source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  ;;
esac

# Setup completions & autosuggestions #########################################
case $OSTYPE in
  linux*)
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
  darwin*)
    source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
esac
fpath=($HOME/.local/share/zsh/completions $fpath)

# Setup YubiKey Agent #########################################################
case $OSTYPE in
  darwin*)
    export SSH_AUTH_SOCK="$BREW_PREFIX/var/run/yubikey-agent.sock"
  ;;
esac

# Setup Google Cloud SDK ######################################################
if [ -d "$HOME/.gcloud/sdk" ]; then
    . "$HOME/.gcloud/sdk/path.zsh.inc"
    . "$HOME/.gcloud/sdk/completion.zsh.inc"
fi

compinit

eval "$(starship init zsh)"
