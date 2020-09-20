export EDITOR='vim'
export PROMPT='%F{green}%~ %F{green}❯ %f'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-pattern-search-backward

alias ll="ls -lF --color"
alias ga='git add .'
alias gc='git commit'
alias gp='git push'

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi
