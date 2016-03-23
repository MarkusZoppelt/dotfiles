alias ll="ls -l"
alias uberspace="ssh mzoppelt@sagitta.uberspace.de"
alias blogupdate="cd ~/blog ; jekyll build && scp -r _site/* mzoppelt@zoppelt.net:html/ "
alias blogupdate-lite="cd ~/blog ; jekyll build && scp -r _site/*[^assets/] mzoppelt@zoppelt.net:html/ "
alias bloglocal="cd ~/blog && jekyll serve --config _config_dev.yml -w"
alias pi="ssh pi@pi.zoppelt.net"
alias pizero="ssh pi@pizero.zoppelt.net"

_macadmin()
{
tmux new-session -d -s admin
tmux send-keys 'ssh markuszoppelt@mac9lab.informatik.fh-nuernberg.de' 'C-m'
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac1lab.informatik.fh-nuernberg.de' 'C-m'
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac2lab.informatik.fh-nuernberg.de' 'C-m'
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac3lab.informatik.fh-nuernberg.de' 'C-m'
tmux select-layout tiled
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac4lab.informatik.fh-nuernberg.de' 'C-m'
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac5lab.informatik.fh-nuernberg.de' 'C-m'
tmux select-layout tiled
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac6lab.informatik.fh-nuernberg.de' 'C-m'
tmux select-layout tiled
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac7lab.informatik.fh-nuernberg.de' 'C-m'
tmux select-layout tiled
tmux splitw
tmux send-keys 'ssh markuszoppelt@mac8lab.informatik.fh-nuernberg.de' 'C-m'
tmux select-layout tiled
tmux -2 attach-session -t admin	
}
alias macadmin=_macadmin

# tmux resizing
alias tdown="tmux resize-pane -D $1"
alias tright="tmux resize-pane -R $1"
alias tleft="tmux resize-pane -L $1"
alias tup="tmux resize-pane -U $1"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
