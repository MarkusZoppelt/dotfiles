if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
    if [[ -d ~/code/scripts ]]; then
        export PATH=$PATH:~/code/scripts
    fi
fi

if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

if [[ -d /usr/bin: ]]; then
	export PATH=/usr/bin:$PATH
fi

if [[ -d /bin ]]; then
	export PATH=/bin:$PATH
fi

if [[ -d /usr/local/bin ]]; then
	export PATH=/usr/local/bin:$PATH
fi

if [[ -d /usr/local/sbin ]]; then
	export PATH=/usr/local/sbin:$PATH
fi

if [[ -d ~/.local/bin ]]; then
	export PATH=~/.local/bin:$PATH
fi

export MANPATH="/usr/local/man:$MANPATH"

export HOMEBREW_NO_ANALYTICS=1
