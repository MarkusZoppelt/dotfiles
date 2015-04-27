alias ll="ls -l"
alias uberspace="ssh mzoppelt@sagitta.uberspace.de"
alias vpn="osascript ~/Scripts/VPN-Campus.scpt"
alias novpn="osascript ~/Scripts/NO-VPN-Campus.scpt"
_master()
{
	cd /Users/markuszoppelt/Studium/Master/1-SS2015
	cd $1
}
alias master=_master
alias blogupdate="cd ~/blog ; jekyll build && scp -r _site/* mzoppelt@sagitta.uberspace.de:html/ "
alias bloglocal="cd ~/blog && jekyll serve --config _config_dev.yml -w"
alias pi="ssh pi@192.168.2.116"
