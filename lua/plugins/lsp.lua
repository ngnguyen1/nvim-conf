return {
  -- Mason: package manager for LSP servers / DAP / formatter / linter installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- mason-lspconfig: bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        -- List of servers to automatically install
        ensure_installed = {
          "lua_ls",        -- Lua
          "ts_ls",         -- TypeScript/JavaScript
          "rust_analyzer", -- Rust (used by rust-tools.nvim)
          -- "pyright",    -- Python
          -- "codelldb",   -- optional: Rust debugging
        },
        automatic_installation = true, -- auto-install other servers you configure
      })
    end,
  },
  -- LSP Config: configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Basic LSP keymaps (optional but very useful)
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- TypeScript/JavaScript (ts_ls)
      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        -- Add ts-specific settings here if needed
        -- settings = {
        --   tsserver = { ... }
        -- },
      })

      -- Lua (lua_ls)
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Use LuaJIT runtime
            },
            diagnostics = {
              globals = { "vim" }, -- Recognize the `vim` global
            },
            telemetry = {
              enable = false, -- Disable telemetry
            },
          },
        },
      })
    end,
  },
}

