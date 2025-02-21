return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				marks = true, -- Show marks
				registers = true, -- Show registers
				spelling = { enabled = true, suggestions = 20 }, -- Spelling suggestions
				presets = { operators = true, motions = true, text_objects = true },
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
				ellipsis = "…",
			},
			win = {
				no_overlap = true,
				padding = { 1, 2 },
				title = true,
				title_pos = "center",
				zindex = 1000,
				bo = {},
				wo = {
					-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				},
			},
			layout = {
				width = { min = 20, max = 50 },
				spacing = 3,
			},
			show_help = true,
		})

		-- Key mappings
		wk.add({
			-- LSP
			-- { mode = "n", prefix = "<leader>", noremap = true, silent = true },
			{ "<leader>l", group = "+LSP" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
			{ "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart LSP" },
			{
				"<leader>lf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				desc = "Format Code",
			},
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
			{ "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Docs" },
			{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
			{ "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },
			{ "<leader>lg", group = "+GoTo" },
			{ "<leader>lgd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definition" },
			{ "<leader>lgi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to Implementation" },
			{ "<leader>lgr", "<cmd>Telescope lsp_references<cr>", desc = "Find References" },
			{ "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration" },
			{ "<leader>lgt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Go to Type Definition" },

			-- Copilot
			{
				mode = { "n", "v" },
				{ "<leader>C", group = "+Copilot" },
				{ "<leader>Cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
				{ "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Explain Code" },
			},

			-- File operations
			{ "<leader>f", group = "+File" },
			{ "<leader>fd", "<cmd>!rm %<cr>", desc = "Delete Current File" },
			{
				"<leader>fr",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename Current File",
			},
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "Find Files",
			},
			{ "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
			{ "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fs", "<cmd>w<cr>", desc = "Save File" },
			{ "<leader>fS", "<cmd>wa<cr>", desc = "Save All" },

			-- Buffer management
			{ "<leader>b", group = "+Buffer" },
			{ "<leader>bc", "<cmd>bd<cr>", desc = "Close Buffer" },
			{ "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
			{ "<leader>bn", "<cmd>bn<cr>", desc = "Next Buffer" },
			{ "<leader>bp", "<cmd>bp<cr>", desc = "Previous Buffer" },

			-- Window management
			{ "<leader>w", group = "+Window" },
			{ "<leader>w=", "<cmd>wincmd =<cr>", desc = "Balance Windows" },
			{ "<leader>wd", "<cmd>close<cr>", desc = "Close Window" },
			{ "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split" },
			{ "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split" },

			-- Search
			{ "<leader>s", group = "+Search" },
			{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
			{ "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps" },

			-- Git operations
			{ "<leader>G", group = "+Git" },
			{
				"<leader>Gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Open Lazygit",
			},
			{
				"<leader>Gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>Gf",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "Git current file history",
			},
			{
				"<leader>Gp",
				"<cmd>Gitsigns preview_hunk<cr>",
				desc = "Git preview",
			},
			{
				"<leader>Gb",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				desc = "Git toggle blame line",
			},

			-- Misc
			{
				mode = { "n" },
				"<leader>/",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Search keyword in buffer",
			},
			{
				"<C-e>",
				"<cmd>Neotree toggle<cr>",
				desc = "File explorer",
			},
			-- vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { silent = true })
			{
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
				{ "<leader>Q", "<cmd>q<cr>", desc = "Quit" },
			},
			{
				mode = { "v" },
				{ "J", ":m '>+1<cr>gv=gv", desc = "Move line down" },
				{ "K", ":m '<-2<cr>gv=gv", desc = "Move line up" },
			},
		})
	end,
}
