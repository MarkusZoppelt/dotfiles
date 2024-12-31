#!/bin/bash

echo "Creating symlinks"
ln -nsf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -nsf ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -nsf ~/.dotfiles/.profile ~/.profile
ln -nsf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -nsf ~/.dotfiles/.zshenv ~/.zshenv
ln -nsf ~/.dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -nsf ~/.dotfiles/config/alacritty ~/.config/alacritty
ln -nsf ~/.dotfiles/config/gh-copilot ~/.config/gh-copilot
ln -nsf ~/.dotfiles/config/ghostty ~/.config/ghostty
ln -nsf ~/.dotfiles/config/nvim ~/.config/nvim
ln -nsf ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -nsf ~/.dotfiles/config/wezterm ~/.config/wezterm

if [ "$(uname)" == "Darwin" ]; then
    brew bundle --file ~/.dotfiles/Brewfile
    ln -nsf ~/.dotfiles/.zprofile ~/.zprofile
fi

if [ "$(uname)" == "Linux" ]; then
    ln -nsf ~/.dotfiles/config/hypr ~/.config/hypr

    # Install apt packages
    if [ -x "$(command -v apt)" ]; then
        sudo apt update
        sudo apt install -y $(cat ~/.dotfiles/pkglist)
        # sudo apt install -y $(cat ~/.dotfiles/pkglist-nvidia)
    fi

    if [ ! -x "$(command -v rustup)" ]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    if [ ! -x "$(command -v starship)" ]; then
        curl -sS https://starship.rs/install.sh | sh
    fi

    if [ ! -x "$(command -v tailscale)" ]; then
        curl -fsSL https://tailscale.com/install.sh | sh
    fi
fi

# Installing tools
mkdir -p ~/.local/bin
ln -nsf ~/.dotfiles/bin/* ~/.local/bin

echo "Setting up ssh keys"
mkdir -p ~/.ssh
curl https://github.com/MarkusZoppelt.keys > ~/.ssh/authorized_keys
