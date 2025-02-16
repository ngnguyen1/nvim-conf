return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				-- TODO: check why it's not working: getting error
				-- failed to load builtin eslint_d
				-- null_ls.builtins.diagnostics.eslint_d,
			},
		})
	end,
}
