-- Complete nvim-cmp + Copilot + Snippets + Icons Setup

return {
  -----------------------------------------------------------
  -- Copilot Core
  -----------------------------------------------------------
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Enable copilot suggestions
      vim.g.copilot_no_tab_map = true -- disable default <Tab>

      -- Auto-trigger suggestions (closest equivalent)
      vim.g.copilot_assume_mapped = true

      -- Filetype rules
      vim.g.copilot_filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      }

      local keymap = vim.keymap.set

      -- Accept whole suggestion
      keymap("i", "<M-CR>", 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept"
      })

      -- Accept word
      keymap("i", "<M-f>", 'copilot#AcceptWord()', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Word"
      })

      -- Accept line
      keymap("i", "<M-l>", 'copilot#AcceptLine()', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Line"
      })

      -- Next suggestion
      keymap("i", "<M-]>", 'copilot#Next()', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Next"
      })

      -- Previous suggestion
      keymap("i", "<M-[>", 'copilot#Previous()', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Previous"
      })

      -- Dismiss
      keymap("i", "<C-e>", 'copilot#Dismiss()', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Dismiss"
      })
    end,
  },

  -----------------------------------------------------------
  -- Copilot CMP Integration
  -----------------------------------------------------------
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -----------------------------------------------------------
  -- nvim-cmp Core
  -----------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",         -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- snippet completion source
      "hrsh7th/cmp-nvim-lsp",     -- LSP completion
      "hrsh7th/cmp-buffer",       -- buffer words
      "hrsh7th/cmp-path",         -- path completion
      "onsails/lspkind.nvim",     -- icons
      "zbirenbaum/copilot-cmp",   -- copilot completion
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- load friendly snippets (expandable later)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<A-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Copilot = "" },
          }),
        },

        -- Do not include copilot to the source
        -- to avoid duplicate suggestions
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

