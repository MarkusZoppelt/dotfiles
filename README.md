# Dotfiles

    git clone https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles


Install everything with `brew`:

    brew bundle --file ~/.dotfiles/Brewfile


Create symlinks:

    ln -nsf ~/.dotfiles/.zshrc ~/.zshrc
    ln -nsf ~/.dotfiles/.vimrc ~/.vimrc
    ln -nsf ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -nsf ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -nsf ~/.dotfiles/.gitignore_global ~/.gitignore_global
    ln -nsf ~/.dotfiles/nvim ~/.config/nvim
