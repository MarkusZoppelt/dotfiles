#!/bin/sh

echo "installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brewing all the things"

brew install aria2
brew install hub
brew install neovim
brew install reattach-to-user-namespace
brew install beeftornado/rmtree/brew-rmtree
brew install tmux
brew install wget