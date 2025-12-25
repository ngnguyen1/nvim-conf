-- [[ Set up keymaps ]] See `:h keymap()`, `:h mapping`, `:h keycodes`

local keymap = vim.keymap.set

-- Use <Esc> to exit terminal mode
keymap('t', '<Esc>', '<C-\\><C-n>')

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Navigate vim panes better
keymap('n', '<c-k>', ':wincmd k<CR>')
keymap('n', '<c-j>', ':wincmd j<CR>')
keymap('n', '<c-h>', ':wincmd h<CR>')
keymap('n', '<c-l>', ':wincmd l<CR>')

-- Map <C-j>, <C-k>, <C-h>, <C-l> to navigate between windows in any modes
keymap({ 't', 'i' }, '<c-h>', '<C-\\><C-n><C-w>h')
keymap({ 't', 'i' }, '<c-j>', '<C-\\><C-n><C-w>j')
keymap({ 't', 'i' }, '<c-k>', '<C-\\><C-n><C-w>k')
keymap({ 't', 'i' }, '<c-l>', '<C-\\><C-n><C-w>l')

-- -- Move line up/down in Normal Mode (VSCode style: Alt+Up, Alt+Down)
-- keymap("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
-- keymap("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })
-- move line up/down in Visual Mode (VSCode style: Alt+Up, Alt+Down)
-- keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Use Alt+j/k for moving lines (more common pattern)
keymap('n', '<M-j>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
keymap('n', '<M-k>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })
keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })

-- Delete words with CTRL-Backspace/Alt-Backspace in insert mode
keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
keymap("x", "<C-BS>", "<C-w>", { noremap = true, silent = true })
keymap("i", "<M-BS>", "<C-w>", { noremap = true, silent = true })

-- -- Move cursor by words with Alt+Left/Right in insert mode
-- keymap('i', '<M-b>', '<C-o>b', { desc = 'Back word', noremap = true, silent = true })
-- keymap('n', '<M-b>', 'b', { desc = 'Back word', noremap = true, silent = true })
-- keymap('i', '<M-f>', '<C-o>w', { desc = 'Forward word', noremap = true, silent = true })
-- keymap('n', '<M-f>', 'w', { desc = 'Forward word', noremap = true, silent = true })
-- keymap('i', '<M-d>', '<C-o>dw', { desc = 'Delete word forward', noremap = true, silent = true })
-- keymap('n', '<M-d>', 'dw', { desc = 'Delete word forward', noremap = true, silent = true })

-- Trim trailing spaces
keymap("n", "<leader>ts", function()
  vim.cmd("%s/\\s\\+$//e")
end, { desc = "Trim trailing spaces" })

-- Normal mode
keymap('n', '<Tab>', '>>', { noremap = true, silent = true })
keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })

-- Visual mode
keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Buffers
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
keymap("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" })

-- Resize window using <shift> arrow keys
keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")
