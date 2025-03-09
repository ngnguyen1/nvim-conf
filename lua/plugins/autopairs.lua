return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			typescript = { "template_string" },
		},
	},
}
