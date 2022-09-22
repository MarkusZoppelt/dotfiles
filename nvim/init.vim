" Check if vim-plug is installed => if not, install it
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

call plug#begin()
Plug 'github/copilot.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'jamessan/vim-gnupg'
call plug#end()

" General vim config
source $HOME/.vimrc
colorscheme gruvbox

" Language specific requires
lua require('lspconfig').pyright.setup{}
lua require('lang.go')
lua require('lang.rust')
autocmd BufWritePre *.go :silent! lua require("go.format").gofmt()
let g:rustfmt_autosave = 1

" Load Lua scripts
lua require('lualine').setup()

" Load remaps
source $HOME/.config/nvim/remaps.vim

" copilot config
lua vim.g.copilot_no_tab_map = true
lua vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
