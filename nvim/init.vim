call plug#begin()
Plug 'github/copilot.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
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
call plug#end()

" General vim config
source ~/.vimrc
set mouse=a
set t_Co=256
set t_ut=
colorscheme codedark
set completeopt=menu,menuone,noselect
set ignorecase
set smartcase

" Load Lua scripts
lua require('lang.go')
lua require('lang.rust')
lua require("nvim-tree").setup()
lua require('lspconfig').pyright.setup{}
lua require('lualine').setup()


" Format Go code when saving
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()

" load remaps
source ~/.dotfiles/nvim/remaps.vim
