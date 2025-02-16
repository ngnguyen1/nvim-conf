return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			css = { "stylelint" },
			html = { "htmlhint" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
			markdown = { "markdownlint" },
			python = { "pylint" },
		}
		-- Automatically run linting on file open - uncomment when ready
		-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		--
		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		-- 	group = lint_augroup,
		-- 	callback = function()
		-- 		lint.try_lint()
		-- 	end,
		-- })

		vim.keymap.set("n", "<leader>vl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
