filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-scripts/Greplace.vim'
Plugin 'lervag/vimtex'
Plugin 'neomake/neomake'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on
