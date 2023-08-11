local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'github/copilot.vim'
Plug('folke/tokyonight.nvim', {branch = 'main'})
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug ('VonHeikemen/lsp-zero.nvim', {branch = 'v2.x'})
Plug 'tpope/vim-fugitive'
vim.call('plug#end')

-- set term color 256
vim.o.termguicolors = true

vim.g.mapleader = ","
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.backspace = "indent,eol,start"
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.linebreak = true
vim.opt.completeopt = "menu,menuone,noselect"

require('tokyonight').setup({transparent = true})
require('treesitter')
require('treesitter-context').setup()
require('lsp')
require('copilot')
require('remaps')

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  colorscheme tokyonight-night
  set vb t_vb=""
  set nohlsearch
  TSContextEnable
]]
