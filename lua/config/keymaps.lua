-- Open parent directory of current file
vim.keymap.set("n", "<leader>-", "<CMD>Neotree float<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "File Explorer" })

-- colorscheme picker
-- vim.keymap.set("n", "<C-n>", ":Telescope colorscheme<CR>", { noremap = true, desc = "Select colorscheme" })

-- Show current diagnostic in a float
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

vim.keymap.set({ "n", "v" },
  "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end,
  { desc = "[C]ode [F]ormat" })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Tab/Shift-Tab to indent/unindent
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>"
        or vim.fn.col('.') > 1 and "<C-t>"
        or "<Tab>"
end, { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })

-- Move line up/down in Normal Mode (VSCode style: Alt+Up, Alt+Down)
vim.keymap.set("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected block up/down in Visual Mode (Alt+Up, Alt+Down)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Ensure vim-visual-multi is properly set up
vim.api.nvim_exec([[
  let g:VM_mouse_mappings = 1
]], false)

-- Multi-cursor keymaps using vim.keymap.set
vim.keymap.set("n", "<C-d>", "<Plug>(VM-Find-Under)", { noremap = true, silent = true, desc = "Find next occurrence (multi-cursor)" })
vim.keymap.set("n", "<C-S-d>", "<Plug>(VM-Select-All)", { noremap = true, silent = true, desc = "Select all occurrences (multi-cursor)" })
vim.keymap.set("n", "<A-j>", "<Plug>(VM-Add-Cursor-Down)", { noremap = true, silent = true, desc = "Add cursor down" })
vim.keymap.set("n", "<A-k>", "<Plug>(VM-Add-Cursor-Up)", { noremap = true, silent = true, desc = "Add cursor up" })
-- vim.keymap.set("n", "q", "<Plug>(VM-Skip-Region)", { noremap = true, silent = true, desc = "Skip match" })
-- vim.keymap.set("n", "Q", "<Plug>(VM-Remove-Region)", { noremap = true, silent = true, desc = "Remove last cursor" })

-- Toggle diagnostic view
vim.keymap.set("n", "<Leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle [D]iagnostics" })

-- Window resizing
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-n>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":cprev<CR>", { silent = true })

-- Delete words with CTRL-Backspace/Alt-Backspace in insert mode
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("x", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true, silent = true })

-- Git operations
vim.keymap.set("n", "<leader>Gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git toggle blame line" })
vim.keymap.set("n", "<leader>Gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Git preview (Hunks)" })

-- FZF keymaps
-- local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>fp", "<cmd>FzfDirectories<CR>", { desc = "[F]ind [P]aths" })
-- vim.keymap.set("n", "<leader>fb", fzf.builtin, { desc = "[F]ind [B]uiltin FZF" })

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("keymaps-lsp-attach", { clear = true }),
  callback = function()
    -- [G]oto [D]efinition(s)
    vim.keymap.set("n", "gd", function()
      local params = vim.lsp.util.make_position_params()
      vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
        local items = result
        if type(result) == "table" and result.result then
          items = result.result
        end

        if not items or vim.tbl_isempty(items) then
          vim.notify("No definition found", vim.log.levels.ERROR)
        elseif #items == 1 then
          vim.lsp.buf.definition(params)
        else
          require("fzf-lua").lsp_definitions()
        end
      end)
    end, { desc = "[G]oto [D]efinition(s)" })

    -- [G]oto [R]eference(s)
    vim.keymap.set("n", "gr", function()
      local params = vim.lsp.util.make_position_params()
      params.context = { includeDeclaration = true }
      vim.lsp.buf_request(0, "textDocument/references", params, function(_, result)
        local items = result
        if type(result) == "table" and result.result then
          items = result.result
        end

        if not items or vim.tbl_isempty(items) then
          vim.notify("No references found", vim.log.levels.ERROR)
        else
          require("fzf-lua").lsp_references()
        end
      end)
    end, { desc = "[G]oto [R]eference(s)" })

    -- [G]oto [I]mplementation(s)
    vim.keymap.set("n", "gI", function()
      local params = vim.lsp.util.make_position_params()
      vim.lsp.buf_request(0, "textDocument/implementation", params, function(_, result)
        local items = result
        if type(result) == "table" and result.result then
          items = result.result
        end

        if not items or vim.tbl_isempty(items) then
          vim.notify("No implementation found", vim.log.levels.ERROR)
        elseif #items == 1 then
          vim.lsp.buf.implementation(params)
        else
          require("fzf-lua").lsp_implementations()
        end
      end)
    end, { desc = "[G]oto [I]mplementation(s)" })

    -- [G]oto [D]eclaration
    vim.keymap.set("n", "gD", function()
      -- Check if declaration is supported
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      local has_support = false
      for _, client in ipairs(clients) do
        if client.supports_method("textDocument/declaration") then
          has_support = true
          break
        end
      end

      if not has_support then
        vim.notify("LSP method textDocument/declaration not supported", vim.log.levels.ERROR)
        return
      end

      local params = vim.lsp.util.make_position_params()
      vim.lsp.buf_request(0, "textDocument/declaration", params, function(_, result)
        local items = result
        if type(result) == "table" and result.result then
          items = result.result
        end

        if not items or vim.tbl_isempty(items) then
          vim.notify("No declaration found", vim.log.levels.ERROR)
        elseif #items == 1 then
          vim.lsp.buf.declaration(params)
        else
          require("fzf-lua").lsp_declarations()
        end
      end)
    end, { desc = "[G]oto [D]eclaration" })

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    vim.keymap.set("n", "<leader>D", require("fzf-lua").lsp_typedefs, { desc = "Type [D]efinition" })

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename" })

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    -- LSP Format buffer
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "[F]ormat buffer" })
    -- Show lsp hover on CTRL-K as well as the SHIFT-K default
    vim.keymap.set("n", "<C-K>", vim.lsp.buf.hover, { desc = "LSP: Show [H]over" })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
    vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
    -- { "<leader>ls",  "<cmd>lua vim.lsp.buf.signature_help()<cr>",  desc = "Signature Help" },
    -- { "<leader>lR",  "<cmd>lua vim.lsp.buf.rename()<cr>",          desc = "Rename Symbol" },
  end,
})

-- copilot keymaps
vim.keymap.set({ "n", "v" }, "<leader>Cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
vim.keymap.set({ "n", "v" }, "<leader>Ce", "<cmd>CopilotChatExplain<cr>", { desc = "[C]opilot Explain Code" })
vim.keymap.set({ "n", "v" }, "<leader>Cp", "<cmd>CopilotChatPrompts<cr>", { desc = "Copilot Prompt" })
