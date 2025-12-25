return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.1.9",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          hidden = true,
        },
        buffers = {
          theme = "ivy",
        },
      },
      extensions = {
        ["ui-select"] = themes.get_dropdown({}),
      },
    })
    telescope.load_extension("ui-select")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
  end,
}

