filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'toyamarinyon/vim-swift'
Plugin 'Shougo/vimproc.vim'
Plugin 'benmills/vimux'
Plugin 'def-lkb/vimbufsync'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on
