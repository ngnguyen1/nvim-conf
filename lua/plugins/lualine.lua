return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function copilot_status()
			if vim.fn["copilot#Enabled"]() == 1 then
				return " "
			else
				return " "
			end
		end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin", -- dracula
				globalstatus = true,
				-- component_separators = { left = "", right = "" }, -- Between components
				--     section_separators = { left = "", right = "" }, -- Bubble-style sections
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = '',
				-- section_separators = { right = "", left = "" }, -- Between sections
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
				lualine_b = {
					{
						"filename",
						symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
					},
					{ "branch" },
				},
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
					-- {
					-- 	"filename",
					-- 	path = 4, -- Show relative path
					-- },
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype", "progress", copilot_status },
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, left_padding = 2 },
				},
				-- lualine_a = { { "mode", separator = { left = "", right = "" } } },
				-- -- lualine_b = { "branch", "diff", "diagnostics" },
				-- lualine_b = {
				-- 	{ "branch", separator = { left = "", right = "" } },
				-- 	{ "diff", separator = { left = "", right = "" } },
				-- },
				-- lualine_c = {
				-- 	{
				-- 		"filename",
				-- 		path = 1, -- Show relative path
				-- 		symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
				-- 	},
				-- },
				-- lualine_x = {
				-- 	"encoding",
				-- 	"fileformat",
				-- 	{ "filetype", separator = { left = "", right = "" } },
				-- },
				-- lualine_y = { { "progress", separator = { left = "", right = "" } } },
				-- lualine_z = { { "location", separator = { left = "", right = "" } } },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
