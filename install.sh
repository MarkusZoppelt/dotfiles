#!/bin/bash

echo "installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "running on macOS"
	
    echo "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "brewing all the things"
    source install/brew.sh

    echo "updating macOS settings"
    source install/macOS.sh
fi

echo "Vundle extra..."
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "configuring zsh as default shell"
chsh -s $(which zsh)
