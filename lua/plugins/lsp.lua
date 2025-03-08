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
        ensure_installed = { "lua_ls", "ts_ls", "terraformls", "volar" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local mason_registry = require("mason-registry")
      local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server"
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = { "javascript", "typescript", "vue" },
      })
      lspconfig.volar.setup({
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })
      lspconfig.terraformls.setup({
        cmd = { "terraform-ls", "serve" },
        filetypes = { "hcl", "tf", "tfvars" },
        settings = {},
        root_dir = lspconfig.util.root_pattern(".git", ".terraform", ".gitignore"),
      })
    end,
  },
}
