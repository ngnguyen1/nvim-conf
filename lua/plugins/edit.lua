return {
  {
    -- wrap/change/delete surroundings on existing text
    "kylechui/nvim-surround",
    version = "*", -- use latest tagged version
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- leave empty for defaults; customize here needed
      })
    end,
  },
  {
    -- Automatic closing of brackets/quotes while typing
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- load when you start typing
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = {
          "TelescopePrompt",
          "vim"
        }, -- disable in these filetypes
        check_ts = false, -- Disable Treesitter checks
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      system_clipboard = {
        sync_with_ring = true,
        clipboard_register = nil,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
      preserve_cursor_position = {
        enabled = true,
      },
    },
    keys = {
      -- Yank/Put
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after and move cursor" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before and move cursor" },
      -- Cycle through yank history after pasting
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      -- Open yank history in Telescope
      { "<leader>y", "<cmd>Telescope yank_history<cr>", mode = { "n", "x" }, desc = "Open yank history" },
    },
  },
}

