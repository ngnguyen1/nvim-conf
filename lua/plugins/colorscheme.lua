return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- transparent_background = true,
			integrations = {
				gitsigns = true,
				treesitter = true,
				neotree = true,
				telescope = true,
				which_key = true,
				copilot_vim = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
