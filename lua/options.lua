vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2 -- Defines how many spaces a tab character represents.
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Determines the number of spaces for indentation
vim.opt.shiftround = true
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Always allow copy/paste from system clipboard
vim.opt.clipboard:append("unnamedplus")

-- UI configs
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.splitright = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- scroll
vim.opt.scrolloff = 10
vim.opt.scroll = 50
