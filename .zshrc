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

# Setup LLVM ##################################################################
if [ "$(uname)" = "Darwin" ]; then
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
	export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
fi

# Setup Node with fnm #########################################################
if [ -x "$(command -v fnm)" ]; then
	eval "$(fnm env --use-on-cd)"
fi

# Setup fzf ###################################################################
if [ "$(uname)" = "Darwin" ]; then
	if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
		PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2>/dev/null
	source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi
if [ "$(uname)" = "Linux" ]; then
	if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
		PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
	fi
	[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2>/dev/null
	source "$HOME/.fzf/shell/key-bindings.zsh"
fi

# Setup completions & autosuggestions #########################################
if [ "$(uname)" = "Darwin" ]; then
	source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
fpath=($HOME/.local/share/zsh/completions $fpath)

# Setup YubiKey Agent #########################################################
if [ "$(uname)" = "Darwin" ]; then
	export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"
fi

# if zoxide is installed, use it for cd #######################################
if [ -x "$(command -v zoxide)" ]; then
	eval "$(zoxide init zsh)"
	alias cd='z'
fi

compinit

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mz/.gcloud/sdk/path.zsh.inc' ]; then . '/Users/mz/.gcloud/sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mz/.gcloud/sdk/completion.zsh.inc' ]; then . '/Users/mz/.gcloud/sdk/completion.zsh.inc'; fi
