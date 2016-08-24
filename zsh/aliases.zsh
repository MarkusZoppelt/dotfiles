alias ll="ls -lF"
alias uberspace="ssh mzoppelt@zoppelt.net"
alias blogupdate="cd ~/code/blog ; jekyll build && scp -r _site/* mzoppelt@zoppelt.net:html/ "
alias blogupdate-lite="cd ~/code/blog ; jekyll build && scp -r _site/*[^assets/] mzoppelt@zoppelt.net:html/ "
alias bloglocal="cd ~/code/blog && jekyll serve --config _config_dev.yml --drafts -w"

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

function tm() {
	# abort if we're already inside a TMUX session
	[ "$TMUX" == "" ] || exit 0
	# startup a "default" session if non currently exists
	# tmux has-session -t _default || tmux new-session -s _default -d

	# present menu for user to choose which workspace to open
	PS3="Please choose your session: "
	options=($(tmux list-sessions -F "#S") "New Session" "zsh")
	echo "Available sessions"
	echo "------------------"
	echo " "
	select opt in "${options[@]}"
	do
		case $opt in
			"New Session")
				read -p "Enter new session name: " SESSION_NAME
				tmux new -s "$SESSION_NAME"
				break
				;;
			"zsh")
				zsh --login
				break;;
			*)
				tmux attach-session -t $opt
				break
				;;
		esac
	done
}
