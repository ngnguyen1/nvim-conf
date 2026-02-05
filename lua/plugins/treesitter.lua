return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers for these languages
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "toml",
        "python",
        "vue",
        "html",
        "css",
        "json",
        "bash",
        "yaml",
        "markdown",
        "markdown_inline",
        "vimdoc",
        "query",
        "xml",
        "terraform",
        "hcl",
        "groovy",
      },

      sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)

      auto_install = true, -- Automatically install missing parsers when entering buffer
      -- Enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- Enable indentation
      indent = {
        enable = true,
      },
    })
  end,
}
