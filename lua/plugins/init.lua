return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      -- Indentation guides
      indent = {
        -- char = "▏", -- Thinner alternative
        -- char = "│",
        char = "┊", -- Dotted alternative
        tab_char = "│",
        smart_indent_cap = true,
        priority = 1,
      },

      -- Whitespace handling
      whitespace = {
        remove_blankline_trail = true,
      },

      -- -- Scope (current code block highlighting)
      -- scope = {
      --   enabled = true,
      --   char = "│",
      --   -- show_start = true,
      --   -- show_end = true,
      --   show_exact_scope = false,
      --   injected_languages = true,
      --   highlight = "IblScope",
      --   priority = 1024,
      --   include = {
      --     node_type = {},
      --   },
      --   exclude = {
      --     language = {},
      --     node_type = {
      --       ["*"] = { "source_file", "program" },
      --       lua = { "chunk" },
      --       python = { "module" },
      --     },
      --   },
      -- },

      -- Exclude certain buffer types and file types
      exclude = {
        filetypes = {
          "help", "dashboard", "neo-tree", "Trouble", "trouble", "lazy",
          "mason", "notify", "toggleterm", "lazyterm",
        },
        buftypes = { "terminal", "nofile", "quickfix", "prompt" },
      },
    },
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 40,
          side = "right",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
          custom = { "^.git$", },
        },
      })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    ft = { 'markdown' },
    opts = {
      -- Configuration options
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)

      -- Custom link following function
      local function follow_link()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2] + 1

        -- Match image link: ![alt](url) or ![alt](url "title") or ![alt](url?params "title")
        -- Pattern matches: ![...](...) including everything inside parentheses
        for alt, url_with_title in line:gmatch('!%[(.-)%]%((.-)%)') do
          local start_pos = line:find('!%[' .. vim.pesc(alt) .. '%]%(')
          local end_pos = start_pos and (start_pos + #alt + #url_with_title + 4)

          if start_pos and col >= start_pos and col <= end_pos then
            -- Extract URL (remove title and query parameters for file path)
            -- Handle formats: url, url "title", url?params, url?params "title"
            local url = url_with_title:match('^([^%s"]+)')

            -- Remove query parameters for file path resolution
            local clean_url = url:match('^([^%?]+)')

            -- Resolve relative path
            local full_path = vim.fn.expand('%:p:h') .. '/' .. clean_url

            -- Check if file exists
            if vim.fn.filereadable(full_path) == 0 then
              vim.notify('Image file not found: ' .. clean_url, vim.log.levels.WARN)
              return
            end

            -- Open image with default app (Preview on macOS)
            vim.fn.jobstart({ 'open', full_path }, { detach = true })
            return
          end
        end

        -- Match markdown link: [text](url)
        for text, url in line:gmatch('%[(.-)%]%((.-)%)') do
          local start_pos = line:find('%[' .. vim.pesc(text) .. '%]%(')
          local end_pos = start_pos and (start_pos + #text + #url + 3)

          if start_pos and col >= start_pos and col <= end_pos then
            if url:match('^https?://') or url:match('^www%.') then
              -- External URL - open in browser
              vim.fn.jobstart({ 'open', url }, { detach = true })
              return
            elseif url:match('^#') then
              -- Anchor link in same file
              local anchor = url:gsub('^#', ''):gsub('%-', ' ')
              local found = vim.fn.search(anchor, 'w')
              if found == 0 then
                vim.notify('Link or file not found: ' .. url, vim.log.levels.WARN)
              end
              return
            else
              -- File link (relative or absolute) with optional anchor
              local file_path, anchor = url:match('(.-)#(.+)$')
              if not file_path then
                file_path = url
                anchor = nil
              end

              -- Resolve relative path
              local full_path = vim.fn.expand('%:p:h') .. '/' .. file_path

              -- Check if file exists
              if vim.fn.filereadable(full_path) == 0 then
                vim.notify('Link or file not found: ' .. file_path, vim.log.levels.WARN)
                return
              end

              -- Check file extension for special handling
              local extension = file_path:match('%.([^%.]+)$')
              if extension then
                extension = extension:lower()
                -- Handle PDF and image files with Preview/default app
                if extension == 'pdf' or
                  extension == 'png' or
                  extension == 'jpg' or
                  extension == 'jpeg' or
                  extension == 'gif' or
                  extension == 'svg' or
                  extension == 'bmp' or
                  extension == 'webp' then
                  vim.fn.jobstart({ 'open', full_path }, { detach = true })
                  return
                end
              end

              -- Open the file in Neovim
              vim.cmd('edit ' .. vim.fn.fnameescape(full_path))

              -- Navigate to anchor if present
              if anchor then
                local header = anchor:gsub('%-', ' ')
                vim.schedule(function()
                  local found = vim.fn.search(header, 'w')
                  if found == 0 then
                    vim.notify('Header not found: #' .. anchor, vim.log.levels.WARN)
                  end
                end)
              end
              return
            end
          end
        end

        -- If no link found under cursor
        vim.notify('No link found under cursor', vim.log.levels.INFO)
      end

      -- Set keymap for markdown files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(ev)
          vim.keymap.set('n', 'gf', follow_link, { buffer = ev.buf, desc = 'Follow markdown link' })
          vim.keymap.set('n', 'gx', follow_link, { buffer = ev.buf, desc = 'Follow markdown link' })

          -- Toggle markdown rendering (preview mode)
          vim.keymap.set('n', '<leader>mp', '<cmd>RenderMarkdown toggle<cr>',
            { buffer = ev.buf, desc = 'Toggle markdown preview' })
        end,
      })
    end,
  }
}
