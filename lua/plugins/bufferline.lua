return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				numbers = "ordinal",
				separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				max_name_length = 40,
				tab_size = 0,
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = true,
				name_formatter = function(buf)
          local rel_path = vim.fn.fnamemodify(buf.path, ":.")  -- Get relative path
          local filename = vim.fn.fnamemodify(rel_path, ":t")  -- Extract filename
          local dir_path = vim.fn.fnamemodify(rel_path, ":h")  -- Extract relative directory
          local shortened_dir = dir_path:gsub("([^/])[^/]+", "%1")
          if shortened_dir ~= "" then
            return shortened_dir .. "/" .. filename
          else
            return filename
          end
				end,
				indicator = {
					icon = "▎",
					style = "icon",
				},
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})
	end,
}
