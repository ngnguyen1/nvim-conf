return {
  -- change the 'lazy' to false to load it on startup
  -- lazy = true will load it only when you run :colorscheme tokyonight
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = true,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        terminal_colors = true,
      })
      -- vim.cmd.colorscheme("cyberdream")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon", -- Options: "storm", "moon", "night", "day"
        transparent = true, -- Enable transparent background
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = false,
        }
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
}
