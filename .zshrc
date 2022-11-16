alias ls=exa
alias ll="exa -l"
alias l="exa -l"
alias g='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias cat=bat
alias grep=rg
alias find=fd
alias sed=sd
alias vim=nvim

export EDITOR='nvim'

autoload -U compinit

# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "(%b)" 
precmd() { vcs_info }

NEWLINE=$'\n'
PS1='%F{blue}%n@%m %F{green}%~ %F{yellow}${vcs_info_msg_0_} ${NEWLINE}%F{green}> %f'

setopt autocd
setopt prompt_subst
unsetopt BEEP

HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=999999
bindkey '^R' history-incremental-pattern-search-backward

zstyle ':completion:*' menu select=1
setopt COMPLETE_ALIASES

# git signing needs this
export GPG_TTY=$(tty)

[ -f ~/.dotfiles/work.zshrc ] && source ~/.dotfiles/work.zshrc
[ -f ~/.localrc ] && source ~/.localrc

compinit
