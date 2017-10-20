filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/Greplace.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
