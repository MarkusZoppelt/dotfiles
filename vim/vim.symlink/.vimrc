"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'toyamarinyon/vim-swift'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let mapleader=","
color smyck
execute pathogen#infect()
syntax on
filetype plugin on

set ruler
set ai
set vb t_vb=""
set nu
set backspace=indent,eol,start
highlight LineNr ctermfg=lightgrey ctermbg=darkgray

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Mapping save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

map <leader>t :tabnew<CR>

map <C-n> :NERDTreeToggle<CR>
command WQ wq
command Wq wq
command W w
command Q q

" System Clipboard
set clipboard=unnamed

"Invisible Characters
set listchars=tab:▸\ ,eol:¬
" set list
set hlsearch
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let CoqIDE_coqtop = "/usr/local/bin/coqtop"
" let g:CoqIDEDefaultMap = 1

" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()
map <F8> :CoqLaunch<CR>
map <F9> :CoqKill<CR>


" Development
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
nmap <leader>z :call VimuxRunCommand("pdflatex *.tex && open *.pdf")<cr>
nmap <leader>l :call VimuxRunCommand("open -a Safari index.html")<cr>

" Auto close tags
:iabbrev </ </<C-X><C-O>
