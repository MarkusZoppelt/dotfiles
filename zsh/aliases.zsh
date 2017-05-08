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
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tdown="tmux resize-pane -D $1"
alias tright="tmux resize-pane -R $1"
alias tleft="tmux resize-pane -L $1"
alias tup="tmux resize-pane -U $1"

# ----- FUNCTIONS -----

function g() {
    if [[ $# > 0 ]]; then
        # if there are arguments, send them to git
        git $@
    else
        # otherwise, run git status
        git status
    fi
}

function compresspdf() {
  filename=$1
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp_comp.pdf $filename &&\
  mv tmp_comp.pdf $filename
}
function conv2gif()
{
	videofile=$1
	mkdir giffy
	ffmpeg -i $videofile -t 30 giffy/%04d.png
	convert giffy/%04d.png -delay 3 $videofile giffy.gif
	rm -rf giffy/
}
