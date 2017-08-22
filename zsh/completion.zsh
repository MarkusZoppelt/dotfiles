autoload -U compinit
compinit
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' group-name ''
