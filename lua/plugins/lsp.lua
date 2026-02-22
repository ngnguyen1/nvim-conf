return {
  -- Mason: package manager for LSP servers / DAP / formatter / linter
  -- installer
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
      local mlsp = require("mason-lspconfig")

      mlsp.setup({
        -- List of servers to automatically install
        ensure_installed = {
          "lua_ls",        -- Lua
          "ts_ls",         -- TypeScript/JavaScript
          "rust_analyzer", -- Rust (handled by rustaceanvim)
          -- "pyright",    -- Python
        },
        -- only enable lua_ls, ts_ls. Do not enable rust_analyzer because it
        -- is handled by rustaceanvim
        automatic_enable = { "lua_ls", "ts_ls" },
      })
    end,
  },
  -- LSP Config: configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Basic LSP keymaps
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
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
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

