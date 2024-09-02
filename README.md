# Dotfiles

    git clone https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles

## Create symlinks:

### On all systems
    ln -nsf ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -nsf ~/.dotfiles/.gitignore_global ~/.gitignore_global
    ln -nsf ~/.dotfiles/.profile ~/.profile
    ln -nsf ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -nsf ~/.dotfiles/.zshenv ~/.zshenv
    ln -nsf ~/.dotfiles/.zshrc ~/.zshrc
    mkdir -p ~/.config
    ln -nsf ~/.dotfiles/nvim ~/.config/nvim
    ln -nsf ~/.dotfiles/starship.toml ~/.config/starship.toml
    ln -nsf ~/.dotfiles/gh-copilot ~/.config/gh-copilot

### On macOS
    ln -nsf ~/.dotfiles/.zprofile ~/.zprofile # only on macOS
    ln -nsf ~/.dotfiles/wezterm ~/.config/wezterm

#### Install everything with `brew`
    brew bundle --file ~/.dotfiles/Brewfile

### On Linux
    ln -nsf ~/.dotfiles/alacritty ~/.config/alacritty
    ln -nsf ~/.dotfiles/hypr ~/.config/hypr

## Link my tools:

    mkdir -p ~/.local/bin
    ln -nsf ~/.dotfiles/bin/* ~/.local/bin
