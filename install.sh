#!/usr/bin/env bash

echo "Creating symlinks"
ln -nsf ~/.dotfiles/.gitconfig           ~/.gitconfig
ln -nsf ~/.dotfiles/.gitignore_global    ~/.gitignore_global
ln -nsf ~/.dotfiles/.profile             ~/.profile
ln -nsf ~/.dotfiles/.tmux.conf           ~/.tmux.conf
ln -nsf ~/.dotfiles/.zshenv              ~/.zshenv
ln -nsf ~/.dotfiles/.zshrc               ~/.zshrc

mkdir -p ~/.config
ln -nsf ~/.dotfiles/config/gh-copilot    ~/.config/gh-copilot
ln -nsf ~/.dotfiles/config/ghostty       ~/.config/ghostty
ln -nsf ~/.dotfiles/config/lazygit       ~/.config/lazygit
ln -nsf ~/.dotfiles/config/nvim          ~/.config/nvim

if [ "$(uname)" == "Darwin" ]; then
    brew bundle --file ~/.dotfiles/Brewfile
    ln -nsf ~/.dotfiles/.zprofile ~/.zprofile
fi

if command -v hyprland >/dev/null 2>&1; then
    ln -nsf ~/.dotfiles/config/hypr      ~/.config/hypr
    ln -nsf ~/.dotfiles/config/mako      ~/.config/mako
    ln -nsf ~/.dotfiles/config/waybar    ~/.config/waybar
    ln -nsf ~/.dotfiles/config/wofi      ~/.config/wofi
fi

# Installing tools
mkdir -p ~/.local/bin
ln -nsf ~/.dotfiles/bin/* ~/.local/bin

echo "Setting up ssh keys"
mkdir -p ~/.ssh
curl https://github.com/MarkusZoppelt.keys > ~/.ssh/authorized_keys
