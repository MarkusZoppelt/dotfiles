filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'toyamarinyon/vim-swift'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'lervag/vimtex'
Plugin 'benmills/vimux'
Plugin 'sukima/xmledit'
Plugin 'def-lkb/vimbufsync'
Plugin 'the-lambda-church/coquille'
Plugin 'ervandew/supertab'
" Plugin 'msanders/snipmate.vim'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'


call vundle#end()
filetype plugin indent on
