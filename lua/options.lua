vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.cursorline = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
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
vim.wo.number = true
