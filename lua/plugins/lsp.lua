return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "terraformls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.terraformls.setup({
				cmd = { "terraform-ls", "serve" },
				filetypes = { "hcl", "tf", "tfvars" },
				settings = {},
				root_dir = lspconfig.util.root_pattern(".git", ".terraform", ".gitignore"),
			})
		end,
	},
}
