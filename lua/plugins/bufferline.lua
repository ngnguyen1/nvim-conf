return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		require("bufferline").setup({
			options = {
				mode = "tabs",
				numbers = "none",
				separator_style = "thick", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				max_name_length = 40,
				tab_size = 0,
				show_buffer_close_icons = false,
				show_close_icon = false,
				name_formatter = function(buf)
					local rel_path = vim.fn.fnamemodify(buf.path, ":.") -- Get relative path
					local filename = vim.fn.fnamemodify(rel_path, ":t") -- Extract filename
					local dir_path = vim.fn.fnamemodify(rel_path, ":h") -- Extract relative directory
					local shortened_dir = dir_path:gsub("([^/])[^/]+", "%1")
					if shortened_dir ~= "" then
						return shortened_dir .. "/" .. filename
					else
						return filename
					end
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						highlight = "Directory",
						separator = true,
					},
				},
			},
			highlights = {
				buffer_selected = {
					fg = mocha.mauve,
					underline = true, -- Moves the underline to the top
					bold = true,
				},
			},
		})
	end,
}
