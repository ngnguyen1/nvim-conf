return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    window = {
      position = "right",
      mappings = {
        ["Y"] = "none",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
        always_show_by_pattern = {
          "config.*.json",
        },
      },
    },
  },
}
