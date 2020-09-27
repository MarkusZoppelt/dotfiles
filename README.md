# Dotfiles

    git clone --recurse-submodules https://github.com/MarkusZoppelt/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles

Create symlinks:

    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/.vim ~/.vim
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

Optional: Get Smyck color scheme for Vim:

    mkdir -p ~/.vim/colors
		curl 'https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/smyck.vim' > ~/.vim/colors/smyck.vim
