local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath, })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.o.termguicolors = true
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

require("lazy").setup("plugins")
require('remaps')
