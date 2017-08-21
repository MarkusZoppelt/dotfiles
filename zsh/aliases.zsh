alias ls=exa
alias ll="ls -lF"

# git aliases
alias git=hub
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias git-undo='git reset --soft HEAD~1'

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'

function g() {
    if [[ $# > 0 ]]; then
        # if there are arguments, send them to git
        git $@
    else
        # otherwise, run git status
        git status
    fi
}
