# History settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=9999999
export SAVEHIST=9999999

[ -n "$(command -v brew)" ] && HOMEBREW_PREFIX="$(brew --prefix)"
[ -n "$(command -v nvim)" ] && { alias vim=nvim; export EDITOR=nvim; }
[ -n "$(command -v fdfind)" ] && alias fd=fdfind

# Shell Options ###############################################################
setopt autocd
setopt INC_APPEND_HISTORY   # immediately append the history file
setopt EXTENDED_HISTORY     # record timestamp in history
setopt HIST_IGNORE_DUPS     # don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # ignore all duplicate entries
setopt HIST_FIND_NO_DUPS    # do not display a line previously found
setopt HIST_IGNORE_SPACE    # ignore commands that start with space
setopt HIST_SAVE_NO_DUPS    # don't write duplicate entries
setopt SHARE_HISTORY        # share history between sessions
setopt COMPLETE_ALIASES
unsetopt BEEP

# Completion ##################################################################
autoload -Uz compinit
zstyle ':completion:*' menu select=1
compinit -C
fpath=($HOME/.local/share/zsh/completions $fpath)

# Key Bindings ################################################################
bindkey '^R' history-incremental-pattern-search-backward
bindkey -s ^a "tmux a\n"
bindkey -s ^f "tmux-sessionizer\n"

# Aliases #####################################################################
alias ls='ls -F --color=always'
alias ll='ls -l'
alias lg=lazygit
[ -d /Applications/Tailscale.app ] && \
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Setup autosuggestions #######################################################
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -n "$HOMEBREW_PREFIX" ] && \
  [ -f $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup YubiKey Agent #########################################################
case $OSTYPE in
  linux*)
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"
  ;;
  darwin*)
    export SSH_AUTH_SOCK="$HOMEBREW_PREFIX/var/run/yubikey-agent.sock"
  ;;
esac

# Prompt Setup ################################################################
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' on %F{magenta}%b%f%F{blue}%u%c%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
setopt PROMPT_SUBST
PROMPT='${SSH_CONNECTION:+"%F{green}@%m%f "}%F{blue}%B%3~%b%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})❯%f '

# External Tools Initialization ###############################################
[ -n "$(command -v fzf)" ] && eval "$(fzf --zsh)"
[ -n "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh || :
[ -d ~/.opencode/bin ] && export PATH=~/.opencode/bin:$PATH || :
