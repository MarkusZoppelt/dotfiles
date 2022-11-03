local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'github/copilot.vim'
-- Plug 'gruvbox-community/gruvbox'
Plug('folke/tokyonight.nvim', {branch = 'main'})
-- Plug 'nvim-tree/nvim-web-devicons'
-- Plug 'kyazdani42/nvim-tree.lua'
-- Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
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
vim.call('plug#end')

-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backspace = "indent,eol,start"
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.linebreak = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"

-- require("nvim-tree").setup()
require('tokyonight').setup({transparent = true})
require('lspconfig').clangd.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').rust_analyzer.setup{}
-- require('lualine').setup()
require('lang.go')
require('lang.rust')
require('treesitter')
require('copilot')
require('remaps')

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  colorscheme tokyonight-night
  highlight NvimTreeNormal guibg=None
  syntax on
  set vb t_vb=""
  set nohlsearch
]]
