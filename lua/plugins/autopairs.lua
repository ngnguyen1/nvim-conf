return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      typescript = { "string", "template_string" },
    },
    disable_filetype = { "TelescopePrompt", "snacks_picker_input" }, -- :echo &ft to find value for this table
    fast_wrap = {
      chars = { '{', '[', '(', '"', "'" },
    },
  },
}
