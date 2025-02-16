-- Tab/Shift-Tab to indent/unindent
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move up" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move down" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move right" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "no hlsearch" })
