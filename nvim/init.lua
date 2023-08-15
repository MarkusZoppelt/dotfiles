local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'github/copilot.vim'
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'tpope/vim-fugitive'
vim.call('plug#end')

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
vim.opt.visualbell = false
vim.opt.hlsearch = false

require('tokyonight').setup({ transparent = true, style = 'night' })
require('treesitter')
require('treesitter-context').setup({ enable = true })
require('lsp')
require('remaps')
require('copilot')

vim.cmd [[colorscheme tokyonight]]
