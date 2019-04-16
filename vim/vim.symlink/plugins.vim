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
Plugin 'scrooloose/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on
