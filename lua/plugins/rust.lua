-- Rust development: rust-analyzer via rustaceanvim (inlay hints, hover actions, etc.)

return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- recommended to avoid breaking changes
  ft = { "rust" },
  lazy = false, -- plugin handles lazy loading itself
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        hover_actions = {
          replace_builtin_hover = false,
        },
        float_win_config = {
          border = "rounded",
        },
      },
      server = {
        on_attach = function(_, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          -- Rustaceanvim specific keymaps
          vim.keymap.set("n", "<leader>rd", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust debuggables", buffer = bufnr })
          vim.keymap.set("n", "<leader>rr", function()
            vim.cmd.RustLsp("runnables")
          end, { desc = "Rust runnables", buffer = bufnr })
          vim.keymap.set("n", "<leader>re", function()
            vim.cmd.RustLsp("explainError")
          end, { desc = "Rust explain error", buffer = bufnr })
          vim.keymap.set("n", "<leader>rc", function()
            vim.cmd.RustLsp("openCargo")
          end, { desc = "Open Cargo.toml", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--all-targets" },
            },
            cargo = {
              buildScripts = { enable = true },
              loadOutDirsFromCheck = true,
            },
            procMacro = { enable = true },
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              typeHints = { enable = true },
              parameterHints = { enable = true },
            },
          },
        },
      },
      dap = {
        autoload_configurations = true,
      },
    }
  end,
}
