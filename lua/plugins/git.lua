return {
  {
    "tpope/vim-fugitive",
    lazy = true,
    -- cmd to load the plugin
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff split" },
      { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
      { "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
    },
  },
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = 'BufReadPre',
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require('gitsigns').setup({
  --       signs = {
  --         add = { text = '+' },
  --         change = { text = '~' },
  --         delete = { text = '_' },
  --         topdelete = { text = '‾' },
  --         changedelete = { text = '~' },
  --       },
  --       signcolumn = true,
  --       current_line_blame = false,
  --       on_attach = function(bufnr)
  --       local gs = package.loaded.gitsigns
  --       vim.keymap.set('n', ']c', gs.next_hunk, { buffer = bufnr, desc = 'Next Git hunk' })
  --       vim.keymap.set('n', '[c', gs.prev_hunk, { buffer = bufnr, desc = 'Previous Git hunk' })
  --     end,
  --     })
  --   end,
  -- },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}
