alias ll="ls -lF --color"
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
export EDITOR='vim'
export PROMPT='%F{green}%~ %F{green}❯ %f'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-pattern-search-backward

autoload -U compinit
compinit
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi
