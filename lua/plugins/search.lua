return {
	{
		-- https://github.com/ibhagwan/fzf-lua
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.85,
					width = 0.80,
					row = 0.35,
					col = 0.50,
					preview = {
						layout = "flex", -- "horizontal" | "vertical" | "flex"
						scrollbar = "border",
					},
				},
				fzf_opts = {
					["--layout"] = "reverse",
					["--info"] = "inline",
				},
				grep = {
					rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --glob '!.git/'",
				},
			})
		end,
	},
}
