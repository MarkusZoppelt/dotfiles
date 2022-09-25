alias ls=exa
alias ll="exa -l"
alias l="exa -l"
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'

export EDITOR='nvim'
export PROMPT='%F{green}%~ %F{green}> %f'

setopt autocd
unsetopt BEEP

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-pattern-search-backward

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=1
setopt COMPLETE_ALIASES

# git signing needs this
export GPG_TTY=$(tty)

[ -f ~/.localrc ] && source ~/.localrc
