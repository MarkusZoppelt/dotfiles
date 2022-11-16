export PATH=$PATH:~/.local/bin
fpath=(~/.local/share/gh/zsh/completions $fpath)

# Setup cifuzz ##############################################################|
export CIFUZZ_DEVELOPMENT=1                                                 #|
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh   #|
fpath=(~/.local/share/cifuzz/share/cifuzz/zsh/completions $fpath)           #|
# ============================================================================


# Setup Go ##################################################################|
export PATH=$PATH:~/go/bin                                                  #|
# ============================================================================


# Setup LLVM ################################################################|
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"                              #|
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"                               #|
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"                          #|
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
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # linux                 #|
    [ -s "$(brew --prefix nvm)/nvm.sh" ] && source $(brew --prefix nvm)/nvm.sh # osx
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
if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then                  #|
  PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"                      #|
fi                                                                          #|
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"                    #|
# ============================================================================
