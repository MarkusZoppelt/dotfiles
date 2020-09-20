set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'rust-lang/rust.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'jamessan/vim-gnupg'

call vundle#end()            " required
filetype plugin indent on    " required
