return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		styles = {
			blame_line = {},
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e square",
					height = 5,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = {},
		input = {},
		lazygit = {},
		git = {},
		terminal = {},
	},
	keys = {
		{
			"<c-_>",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Terminal",
		},
	},
}
