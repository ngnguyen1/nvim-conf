-- [[ Setting options ]] See `:h vim.o`
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Print the line number in front of each line
vim.o.number = true

vim.opt.breakindent = true -- keeps indentation on wrapped lines
vim.opt.cmdheight = 0 -- hides the command-line unless needed (Neovim 0.9+ feature)
vim.opt.completeopt = "menuone,noselect" -- controls how completion menu behavior (show even with one match, do not preselect )

-- 0 - Show all text normally (no concealment)
-- 1 - Concealed text is completely hidden
-- 2 - Concealed text is replaced with one character (default for many setups)
-- 3 - Concealed text is completely hidden
vim.opt.conceallevel = 0
vim.opt.hidden = true -- allows you to switch buffers without saving.
vim.opt.hlsearch = false -- Disables persistent highlighting after searching
vim.opt.inccommand = "nosplit" -- Shows incremental substitute preview in the buffer, not in a split
vim.opt.joinspaces = false -- Prevents inserting two spaces after punctuation on a join
vim.opt.laststatus = 0 -- Hides the status line entirely (Neovim 0.9+ feature)
vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.pumblend = 10 -- Applies transparency to popup menus
vim.opt.pumheight = 10 -- sets the max number of items in the popup menu
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- Controls what get saved in a session
vim.opt.showmode = false -- Hides the current mode (like --INSERT--)
vim.opt.sidescrolloff = 10 -- Keeps 10 columns visible left/right when horizontally scrolling
vim.opt.signcolumn = "yes" -- Always show the sign column (used for git, diagnostics, etc.)
vim.opt.splitkeep = "screen" -- Keeps the text on the screen steady when splitting
vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.termguicolors = true -- Enables 24-bit RGB color in the terminal
vim.opt.timeoutlen = 300 -- Time (ms) to wait for a mapped sequence to complete
vim.opt.updatetime = 200 -- Time (ms) for cursorHold and swap file updates
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
-- option above, see `:h number_relativenumber`
vim.o.relativenumber = true

-- use spaces for tabs
vim.opt.tabstop = 2 -- Defines how many spaces a tab character represents
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Determines the number of spaces for indentation
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true -- convert typed tabs into spaces

-- Always allow copy/paste from system clipboard
vim.opt.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true -- makes searches case-insensitive
vim.opt.smartcase = true

-- Highlight the line where the cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m" -- filename:line:column:message

-- Show <tab> and trailing spaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.confirm = true -- Prompts for confirmation instead of erroring out (e.g., closing unsaved files)

-- Set default folding to open all folds when a file is opened
vim.opt.foldmethod = "manual" -- Disable automatic folding
vim.opt.foldlevel = 99        -- Open all folds by default

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
