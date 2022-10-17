export PATH=$PATH:~/.local/bin

# Setup cifuzz ##############################################################|
export PATH=$PATH:~/cifuzz/bin                                              #|
export CIFUZZ_INSTALL_ROOT=~/cifuzz                                         #|
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh   #|
fpath=(/Users/mz/cifuzz/share/cifuzz/zsh/completions $fpath)                #|
autoload -U compinit; compinit                                              #|
# ============================================================================


# Setup Go ##################################################################|
export PATH=$PATH:~/go/bin                                                  #|
# ============================================================================


# Setup LLVM ################################################################|
export PATH=$(brew --prefix)/opt/llvm/bin:$PATH                             #|
export LDFLAGS="-L$(brew --prefix)/opt/llvm/lib"                            #|
export CPPFLAGS="-I$(brew --prefix)/opt/llvm/include"                       #|
# ============================================================================


# Setup NVM / Node ##########################################################|
export NVM_DIR="$HOME/.nvm"                                                 #|
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                            #|
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"          #|
# ============================================================================


# Setup fzf #################################################################|
if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then                  #|
  PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"                      #|
fi                                                                          #|
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"                    #|
# ============================================================================
