return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			log_level = "error", -- Set log level to "error" to avoid too much noise
			auto_session_enable_last_session = false, -- Don't restore last session automatically
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Default session location
			auto_session_enabled = true,
			auto_save_enabled = true, -- Automatically save session
			auto_restore_enabled = false, -- Restore session on startup
			auto_session_use_git_branch = false, -- Disable Git-branch based session separation
			bypass_session_save_file_types = { "dashboard", "NvimTree", "lazy", "neo-tree" }, -- Ignore these file types
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents" }, -- Ignore these directories

			-- Custom session settings
			session_lens = {
				load_on_setup = false,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}
