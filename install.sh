#!/bin/sh

echo "installing dotfiles"

echo "initializing submodule(s)"
# git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"
	
    echo "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "brewing all the things"
    source install/brew.sh

    echo "updating OSX settings"
    source install/osx.sh
fi

echo "Vundle extra..."
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

echo "configuring zsh as default shell"
chsh -s $(which zsh)
