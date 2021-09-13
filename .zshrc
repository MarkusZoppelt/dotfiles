alias ls='ls --color'
alias ll="ls -lF --color"
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'

export EDITOR='vim'
export PROMPT='%F{green}%~ %F{green}❯ %f'

unsetopt BEEP

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-pattern-search-backward

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=1
setopt COMPLETE_ALIASES

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.localrc ] && source ~/.localrc
