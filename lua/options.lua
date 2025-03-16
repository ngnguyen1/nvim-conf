vim.opt.cursorline = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2      -- Defines how many spaces a tab character represents.
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2   -- Determines the number of spaces for indentation
vim.opt.shiftround = true
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Always allow copy/paste from system clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

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

vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m" -- filename:line:column:message

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Highlight text for some time after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yank",
})
