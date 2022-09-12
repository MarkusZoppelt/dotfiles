# Dotfiles

    git clone https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles


Install everything with `brew`:

    brew bundle --file ~/.dotfiles/Brewfile


Create symlinks:

    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
    ln -s ~/.dotfiles/nvim ~/.config/nvim

