return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local catppuccin = require("catppuccin.palettes").get_palette()
		local function copilot_status()
			if vim.fn["copilot#Enabled"]() == 1 then
				return " "
			else
				return " "
			end
		end

		local custom_neotree = {
			sections = {
				lualine_a = {
					{ "branch", icon = { "" }, separator = { right = "" } },
				},
				lualine_b = {
					{
						function()
							return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
						end,
						color = { fg = catppuccin.blue, gui = "bold" }, -- Blue folder name
						separator = { right = "" },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			filetypes = { "neo-tree" },
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				globalstatus = true,
				component_separators = "",
				-- section_separators = { left = "", right = "" }, -- Bubble-style sections
				-- component_separators = { left = "", right = "" },
				-- section_separators = { right = "", left = "" }, -- slant-style sections
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { right = "" },
						fmt = function(str)
							return " " .. str
						end,
					},
				},

				lualine_b = {
					{
						"branch",
						icon = { "" },
						separator = { right = "" },
					},
					{
						"diff",
						separator = { right = "" },
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
					{
						"buffers",
						show_filename_only = true,
						hide_filename_extension = false,
						show_modified_status = true,

						mode = 0, -- 0: Shows buffer name
						-- 1: Shows buffer index
						-- 2: Shows buffer name + buffer index
						-- 3: Shows buffer number
						-- 4: Shows buffer name + buffer number
						filetype_names = {
							TelescopePrompt = "Telescope",
							fzf = "FZF",
						},
						-- use_mode_colors = false,

						buffers_color = {
							-- active = { fg = "#ffffff", bg = "#ff79c6", gui = "bold" }, -- Active buffer: White text, Pink background
							-- inactive = { fg = "#bfbfbf", bg = "#44475a" }, -- Inactive buffer: Grey text, Dark background
							active = { fg = catppuccin.blue, bg = catppuccin.surface1, gui = "italic,underline" },
							inactive = { fg = catppuccin.overlay1, bg = catppuccin.mantle },
						},

						max_length = vim.o.columns * 2 / 3,
						symbols = {
							modified = " ●",
							alternate_file = "󰈔 ",
							directory = "",
							readonly = " ",
							unnamed = "[No Name]",
						},
						separator = { left = "", right = "" },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = {
							error = " ", -- Error icon
							warn = " ", -- Warning icon
							hint = " ", -- Hint icon
							info = " ", -- Info icon
						},
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_y = {
					{
						"encoding",
						fmt = function(str)
							return string.upper(str)
						end,
						separator = { left = "" },
					},
					{
						"filetype",
						colored = true,
						icon_only = true,
						separator = { left = "" },
					},
					copilot_status,
				},
				lualine_z = {
					{ "progress", separator = { left = "" } },
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = {
				custom_neotree,
			},
		})
	end,
}
