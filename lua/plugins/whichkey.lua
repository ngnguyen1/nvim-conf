return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true,                                    -- Show marks
        registers = true,                                -- Show registers
        spelling = { enabled = true, suggestions = 20 }, -- Spelling suggestions
        presets = { operators = true, motions = true, text_objects = true },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "󰹍 ",
        ellipsis = "…",
      },
      win = {
        no_overlap = true,
        padding = { 1, 2 },
        title = true,
        -- title_pos = "center",
        zindex = 1000,
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
      layout = {
        width = { min = 20, max = 50 },
        spacing = 3,
      },
      show_help = true,
    })

    -- Key mappings
    wk.add({
      -- -- LSP
      -- -- { mode = "n", prefix = "<leader>", noremap = true, silent = true },
      { "<leader>l",  group = "[L]SP" },
      -- Copilot
      { "<leader>C",  group = "+Copilot" },
      -- File operations
      { "<leader>f",  group = "[F]ind" },
      -- { "<leader>fd", "<cmd>!rm %<cr>", desc = "Delete Current File" },
      -- { "<leader>fn", "<cmd>enew<cr>",                         desc = "New File" },
      -- { "<leader>fs", "<cmd>w<cr>",                            desc = "Save File" },

      -- Buffer management
      { "<leader>b",  group = "+Buffer" },
      { "<leader>bc", "<cmd>bd<cr>",                           desc = "[B]uffer [C]lose" },
      { "<leader>bf", "<cmd>Telescope buffers<cr>",            desc = "[B]uffer [F]ind" },
      { "<leader>bn", "<cmd>bn<cr>",                           desc = "[B]uffer [N]ext" },
      { "<leader>bp", "<cmd>bp<cr>",                           desc = "[B]uffer [P]revious" },
      { "<leader>bl", "<cmd>Neotree buffers reveal float<cr>", desc = "[B]uffer [L]ist" },

      -- Window management
      { "<leader>w",  group = "+Window" },
      { "<leader>w=", "<cmd>wincmd =<cr>",                     desc = "Balance Windows" },
      { "<leader>wd", "<cmd>close<cr>",                        desc = "Close Window" },
      { "<leader>ws", "<cmd>split<cr>",                        desc = "Horizontal Split" },
      { "<leader>wv", "<cmd>vsplit<cr>",                       desc = "Vertical Split" },

      -- Search
      { "<leader>s",  group = "[S]earch" },
      -- Git operations
      { "<leader>G",  group = "[G]it" },
      -- {
      --   "<leader>Gl",
      --   function()
      --     Snacks.lazygit.log()
      --   end,
      --   desc = "Git Log",
      -- },
      -- {
      --   "<leader>Gf",
      --   function()
      --     Snacks.lazygit.log_file()
      --   end,
      --   desc = "Git current file history",
      -- },


      -- Misc
      {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        { "<leader>Q", "<cmd>q<cr>", desc = "[Q]uit" },
      },
      {
        mode = { "v" },
        { "J", ":m '>+1<cr>gv=gv", desc = "Move line down" },
        { "K", ":m '<-2<cr>gv=gv", desc = "Move line up" },
      },
    })
  end,
}
