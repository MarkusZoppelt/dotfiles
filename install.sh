#!/bin/sh
echo "installing dotfiles"

DOTFILES=$HOME/.dotfiles

echo "creating symlinks"
ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/.vim $HOME/.vim
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global

if [ "$(uname)" == "Darwin" ]; then
    echo "running on macOS" 
    source macOS/brew.sh
    source macOS/settings.sh
fi

echo "configuring zsh as default shell"
chsh -s $(which zsh)
