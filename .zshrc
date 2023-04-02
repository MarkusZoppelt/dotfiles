# Setup aliases #############################################################|
alias ls=exa                                                                #|
alias ll="exa -l"                                                           #|
alias l="exa -l"                                                            #|
alias g='git status'                                                        #|
alias ga='git add .'                                                        #|
alias gc='git commit'                                                       #|
alias gp='git push'                                                         #|
alias vim=nvim                                                              #|
alias lg=lazygit                                                            #|
# ============================================================================

# General settings ##########################################################|
export EDITOR='nvim'                                                        #|
                                                                            #|
autoload -U compinit                                                        #|
zstyle ':completion:*' menu select=1                                        #|
setopt COMPLETE_ALIASES                                                     #|
setopt autocd                                                               #|
unsetopt BEEP                                                               #|
                                                                            #|
# Setup go if it's installed                                                #|
if [ -d "$HOME/go/bin" ] ; then                                             #|
    export PATH="$PATH:$HOME/go/bin"                                        #|
fi                                                                          #|
                                                                            #|
                                                                            #|
if [ -d "$HOME/.local/bin" ] ; then                                         #|
    export PATH="$PATH:$HOME/.local/bin"                                    #|
fi                                                                          #|
# ============================================================================

# History ###################################################################|
HISTFILE=$HOME/.zsh_history                                                 #|
HISTSIZE=999999999                                                          #|
SAVEHIST=999999999                                                          #|
bindkey '^R' history-incremental-pattern-search-backward                    #|
# ============================================================================

# Setup LLVM ################################################################|
if [ "$(uname)" = "Darwin" ]; then                                          #|
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"                          #|
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"                           #|
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"                      #|
fi                                                                          #|
# ============================================================================

# Setup NVM / Node ##########################################################|
# https://tommckenzie.dev/posts/reduce-shell-startup-time-by-lazy-loading-nvm.html
function lazy_nvm {                                                         #|
  unset -f nvm                                                              #|
  unset -f npm                                                              #|
  unset -f node                                                             #|
  unset -f npx                                                              #|
  unset -f nvim # Copilot uses Node.js, so we need this too                 #|
  if [ -d "${HOME}/.nvm" ]; then                                            #|
    export NVM_DIR="$HOME/.nvm"                                             #|
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                         #|
  fi                                                                        #|
}                                                                           #|
# aliases                                                                   #|
function nvm { lazy_nvm; nvm "$@"; }                                        #|
function npm { lazy_nvm; npm "$@"; }                                        #|
function node { lazy_nvm; node "$@"; }                                      #|
function npx { lazy_nvm; npx "$@"; }                                        #|
function nvim { lazy_nvm; nvim "$@"; } # Copilot uses Node too              #|
# ============================================================================

# Setup fzf #################################################################|
if [ "$(uname)" = "Darwin" ]; then                                          #|
    if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then              #|
      PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"                  #|
    fi                                                                      #|
    [[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"                #|
fi                                                                          #|
if [ "$(uname)" = "Linux" ]; then                                           #|
    if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then                            #|
      PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"                                #|
    fi                                                                      #|
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2>/dev/null #|
    source "$HOME/.fzf/shell/key-bindings.zsh"                              #|
fi                                                                          #|
# ============================================================================

# Setup cifuzz ##############################################################|
if [ "$(uname)" = "Darwin" ]; then                                          #|
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi                                                                          #|
fpath=($HOME/.local/share/zsh/completions $fpath)                           #|
# ============================================================================

# Setup YubiKey Agent #######################################################|
if [ "$(uname)" = "Darwin" ]; then                                          #|
    export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"      #|
fi                                                                          #|
# ============================================================================

# if zoxide is installed, use it for cd
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
    alias cd='z'
fi

compinit

eval "$(starship init zsh)"
