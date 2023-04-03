local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'github/copilot.vim'
Plug('folke/tokyonight.nvim', {branch = 'main'})
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
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
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"

require('tokyonight').setup({transparent = true})
require('lspconfig').clangd.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').rust_analyzer.setup{}
require('lang.go')
require('lang.rust')
require('lang.typescript')
require('treesitter')
require('treesitter-context').setup()
require('copilot')
require('remaps')

-- Rounded borders for floating windows
require('cmp').setup({ window = { completion = {border = 'rounded'} } })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'})
vim.diagnostic.config{ float= {border='rounded'} }

-- don't underline diagnostic errors
-- e.g. gopls will underline the entire file
-- if package names contain underscores
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false
  }
)

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  colorscheme tokyonight-night
  set vb t_vb=""
  set nohlsearch
  TSContextEnable
]]
