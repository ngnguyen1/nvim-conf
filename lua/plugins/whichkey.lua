return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "󰹍 ",
        ellipsis = "…",
      },
      win = {
        title_pos = "center",
        padding = { 1, 2 },
      },
      layout = {
        align = "right",
        width = { min = 30 },
      },
    })

    wk.add({
      { "<leader>a", group = "AI" },
      { "<leader>b", group = "Buffers" },
      { "<leader>f", group = "File", icon = { icon = "󰈙 " } },
      { "<leader>g", group = "Git" },
      { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
      -- NEW: surround & autopairs groups
      { "<leader>s", group = "Surround" },
      { "<leader>sp", group = "Pairs / Autopairs" },
    })
  end,
}
