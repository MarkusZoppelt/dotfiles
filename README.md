# Dotfiles

    git clone https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles


Install everything with `brew`:

    brew bundle --file ~/.dotfiles/Brewfile


Create symlinks:

    ln -nsf ~/.dotfiles/.asdfrc ~/.asdfrc
    ln -nsf ~/.dotfiles/.envrc ~/.envrc
    ln -nsf ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -nsf ~/.dotfiles/.gitignore_global ~/.gitignore_global
    ln -nsf ~/.dotfiles/.profile ~/.profile
    ln -nsf ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -nsf ~/.dotfiles/.zprofile ~/.zprofile
    ln -nsf ~/.dotfiles/.zshenv ~/.zshenv
    ln -nsf ~/.dotfiles/.zshrc ~/.zshrc
    ln -nsf ~/.dotfiles/alacritty ~/.config/alacritty
    ln -nsf ~/.dotfiles/gh-copilot ~/.config/gh-copilot
    ln -nsf ~/.dotfiles/lsd ~/.config/lsd
    ln -nsf ~/.dotfiles/nvim ~/.config/nvim
    ln -nsf ~/.dotfiles/starship.toml ~/.config/starship.toml
    ln -nsf ~/.dotfiles/wezterm ~/.config/wezterm
