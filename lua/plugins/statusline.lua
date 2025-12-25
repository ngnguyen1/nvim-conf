return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      local function copilot_status()
        if vim.fn["copilot#Enabled"]() == 1 then
          return ""
        else
          return ""
        end
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { right = "", left = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
            },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
            },
            {
              "diff",
              symbols = {
                added = " ",
                modified = " ",
                removed = " "
              },
            },
          },
          lualine_c = {
            {
              "filename",
              symbols = {
                modified = " ●",
                alternate_file = "󰈔 ",
                directory = "",
                readonly = " ",
                unnamed = "[No Name]",
              },
            }
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                hint = " ",
                info = " ",
              },
              colored = true, -- Displays diagnostics status in color if set to true.
              update_in_insert = false, -- Update diagnostics in insert mode.
              always_visible = false, -- Always show diagnostics if true
            },
          },
          lualine_y = {
            {
              "encoding",
              fmt = function(str)
                return str:upper()
              end,
            },
            {
              "fileformat",
              symbols = {
                unix = "LF",
                dos = "CRLF",
                mac = "CR",
              },
            },
            {
              "filetype",
              icon_only = true,
            },
            {
              copilot_status,
            }
          },
          lualine_z = {
            {
              "progress",
            },
            { "location" }
          },
        },
        inactive_sections = {
          lualine_a = {"filename"},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            "location"
          },
        },
        extensions = {},
      })
    end,
  },
}

