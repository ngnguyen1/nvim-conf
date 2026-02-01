# NeoVim Configuration

A modern, minimal Neovim configuration built with Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Table of Contents

- [Installation](#installation)
- [File Structure](#file-structure)
- [Leader Keys](#leader-keys)
- [Editor Settings](#editor-settings)
- [Keymaps](#keymaps)
  - [General Keymaps](#general-keymaps)
  - [Window Navigation](#window-navigation)
  - [Buffer Management](#buffer-management)
  - [Line Movement](#line-movement)
  - [Indentation](#indentation)
  - [Window Resizing](#window-resizing)
- [Plugin Keymaps](#plugin-keymaps)
  - [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
  - [LSP (Language Server Protocol)](#lsp-language-server-protocol)
  - [nvim-cmp (Completion)](#nvim-cmp-completion)
  - [Git (Fugitive & LazyGit)](#git-fugitive--lazygit)
  - [Yanky (Yank History)](#yanky-yank-history)
  - [nvim-surround](#nvim-surround)
  - [nvim-autopairs](#nvim-autopairs)
  - [Which-Key Groups](#which-key-groups)
- [Netrw (File Explorer)](#netrw-file-explorer)
- [Autocommands](#autocommands)
- [Colorschemes](#colorschemes)
- [Installed Plugins](#installed-plugins)

---

## Installation

Clone this repository to your Neovim configuration directory:

```bash
git clone <repo-url> ~/.config/nvim
```

Open Neovim and lazy.nvim will automatically install all plugins.

---

## File Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Plugin version lock file
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Autocommands
    │   ├── keymaps.lua      # Global keymaps
    │   ├── lazy.lua         # lazy.nvim bootstrap
    │   └── options.lua      # Editor settings
    └── plugins/
        ├── colorscheme.lua  # Theme configurations
        ├── completion.lua   # nvim-cmp completion
        ├── edit.lua         # Editing plugins (surround, autopairs, yanky)
        ├── git.lua          # Git integrations
        ├── init.lua         # Plugin loader
        ├── lsp.lua          # LSP configuration
        ├── noice.lua        # UI enhancements (disabled)
        ├── statusline.lua   # Lualine statusline
        ├── telescope.lua    # Fuzzy finder
        ├── treesitter.lua   # Syntax highlighting
        └── whichkey.lua     # Keybinding help
```

---

## Leader Keys

| Key | Type | Description |
|-----|------|-------------|
| `Space` | Leader | Primary leader key for most commands |
| `,` | Local Leader | Secondary leader for filetype-specific commands |

---

## Editor Settings

All editor settings are defined in `lua/config/options.lua`.

### Display Settings

| Setting | Value | Description |
|---------|-------|-------------|
| `number` | `true` | Show line numbers |
| `relativenumber` | `true` | Use relative line numbers for easier jumping with `j`/`k` |
| `cursorline` | `true` | Highlight the line where the cursor is |
| `signcolumn` | `"yes"` | Always show the sign column (for git, diagnostics) |
| `termguicolors` | `true` | Enable 24-bit RGB color in terminal |
| `showmode` | `false` | Hide mode indicator (--INSERT--) since statusline shows it |
| `cmdheight` | `0` | Hide command-line unless needed (Neovim 0.9+) |
| `laststatus` | `0` | Hide the default status line (lualine handles this) |
| `conceallevel` | `0` | Show all text normally (no concealment) |

### Scrolling

| Setting | Value | Description |
|---------|-------|-------------|
| `scrolloff` | `10` | Keep 10 lines visible above/below cursor when scrolling vertically |
| `sidescrolloff` | `10` | Keep 10 columns visible left/right when scrolling horizontally |

### Indentation & Tabs

| Setting | Value | Description |
|---------|-------|-------------|
| `tabstop` | `2` | Number of spaces a tab character represents |
| `softtabstop` | `2` | Number of spaces for tab key in insert mode |
| `shiftwidth` | `2` | Number of spaces for auto-indentation |
| `expandtab` | `true` | Convert tabs to spaces |
| `autoindent` | `true` | Copy indent from current line when starting new line |
| `smartindent` | `true` | Smart auto-indenting for C-like languages |
| `shiftround` | `true` | Round indent to multiple of shiftwidth |
| `breakindent` | `true` | Preserve indentation on wrapped lines |

### Search

| Setting | Value | Description |
|---------|-------|-------------|
| `hlsearch` | `false` | Disable persistent search highlighting |
| `ignorecase` | `true` | Case-insensitive searching |
| `smartcase` | `true` | Case-sensitive if search contains uppercase |
| `inccommand` | `"nosplit"` | Show incremental substitute preview in buffer |
| `grepprg` | `"rg --vimgrep"` | Use ripgrep for `:grep` command |
| `grepformat` | `"%f:%l:%c:%m"` | Format for ripgrep output |

### Buffers & Windows

| Setting | Value | Description |
|---------|-------|-------------|
| `hidden` | `true` | Allow switching buffers without saving |
| `splitright` | `true` | New vertical splits open to the right |
| `splitkeep` | `"screen"` | Keep text stable when splitting |
| `confirm` | `true` | Prompt for confirmation instead of error on unsaved changes |

### Completion & Popup

| Setting | Value | Description |
|---------|-------|-------------|
| `completeopt` | `"menuone,noselect"` | Show completion menu even with one match, don't preselect |
| `pumblend` | `10` | 10% transparency for popup menus |
| `pumheight` | `10` | Max items in popup completion menu |
| `wildmode` | `"longest:full,full"` | Command-line completion mode |

### Timing

| Setting | Value | Description |
|---------|-------|-------------|
| `timeoutlen` | `300` | Time (ms) to wait for mapped sequence to complete |
| `updatetime` | `200` | Time (ms) for CursorHold and swap file updates |

### Clipboard

| Setting | Value | Description |
|---------|-------|-------------|
| `clipboard` | `"unnamedplus"` | Always sync with system clipboard |

### Whitespace Display

| Setting | Value | Description |
|---------|-------|-------------|
| `list` | `true` | Show whitespace characters |
| `listchars` | `tab = '» ', trail = '·', nbsp = '␣'` | Characters to display for tabs, trailing spaces, non-breaking spaces |

### Folding

| Setting | Value | Description |
|---------|-------|-------------|
| `foldmethod` | `"manual"` | Disable automatic folding |
| `foldlevel` | `99` | Open all folds by default |

### Misc

| Setting | Value | Description |
|---------|-------|-------------|
| `mouse` | `"a"` | Enable mouse support in all modes |
| `joinspaces` | `false` | Don't insert two spaces after punctuation on join |
| `sessionoptions` | `{ "buffers", "curdir", "tabpages", "winsize" }` | What gets saved in a session |

---

## Keymaps

All global keymaps are defined in `lua/config/keymaps.lua`.

### General Keymaps

| Key | Mode | Description |
|-----|------|-------------|
| `Esc` | Terminal | Exit terminal mode |
| `j` | Normal | Move down (respects word wrap with `gj`) |
| `k` | Normal | Move up (respects word wrap with `gk`) |
| `<leader>ts` | Normal | Trim trailing whitespace from file |

### Window Navigation

Navigate between split windows using Ctrl + direction keys.

| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl + h` | Normal, Insert, Terminal | Move to left window |
| `Ctrl + j` | Normal, Insert, Terminal | Move to window below |
| `Ctrl + k` | Normal, Insert, Terminal | Move to window above |
| `Ctrl + l` | Normal, Insert, Terminal | Move to right window |

### Buffer Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>bd` | Normal | Close current buffer |
| `<leader>bn` | Normal | Go to next buffer |
| `<leader>bp` | Normal | Go to previous buffer |

### Line Movement

Move lines or selections up/down using Alt + j/k.

| Key | Mode | Description |
|-----|------|-------------|
| `Alt + j` | Normal | Move current line down |
| `Alt + k` | Normal | Move current line up |
| `Alt + j` | Visual | Move selection down |
| `Alt + k` | Visual | Move selection up |

### Indentation

| Key | Mode | Description |
|-----|------|-------------|
| `Tab` | Normal | Indent line (`>>`) |
| `Shift + Tab` | Normal | Unindent line (`<<`) |
| `Tab` | Visual | Indent selection and reselect |
| `Shift + Tab` | Visual | Unindent selection and reselect |

### Window Resizing

| Key | Mode | Description |
|-----|------|-------------|
| `Shift + Up` | Normal | Increase window height by 2 |
| `Shift + Down` | Normal | Decrease window height by 2 |
| `Shift + Left` | Normal | Decrease window width by 2 |
| `Shift + Right` | Normal | Increase window width by 2 |

### Delete Word

| Key | Mode | Description |
|-----|------|-------------|
| `Ctrl + Backspace` | Insert, Visual | Delete word before cursor |
| `Alt + Backspace` | Insert | Delete word before cursor |

---

## Plugin Keymaps

### Telescope (Fuzzy Finder)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (search in files) |
| `<leader>fb` | Normal | Find open buffers |
| `<leader>fh` | Normal | Search help tags |

**Configuration:**
- Dropdown theme for file finder
- Ivy theme for buffer picker
- Ignores `node_modules` and `.git/` directories
- Shows hidden files

---

### LSP (Language Server Protocol)

These keymaps are available when an LSP server is attached to the buffer.

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | Normal | Go to definition |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Show references |
| `K` | Normal | Show hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions |

**Installed LSP Servers (via Mason):**
- `lua_ls` - Lua language server
- `ts_ls` - TypeScript/JavaScript language server

---

### nvim-cmp (Completion)

Completion popup with multiple sources.

| Key | Mode | Description |
|-----|------|-------------|
| `Alt + Space` | Insert | Manually trigger completion menu |
| `Enter` | Insert | Confirm selected completion |
| `Tab` | Insert, Select | Next item in menu / Jump to next snippet placeholder |
| `Shift + Tab` | Insert, Select | Previous item in menu / Jump to previous snippet placeholder |

**Completion Sources (in priority order):**
1. `path` - File path completions
2. `nvim_lsp` - LSP completions
3. `luasnip` - Snippet completions
4. `buffer` - Buffer word completions

---

### Git (Fugitive & LazyGit)

#### vim-fugitive

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gs` | Normal | Git status |
| `<leader>gb` | Normal | Git blame |
| `<leader>gd` | Normal | Git diff (vertical split) |
| `<leader>gl` | Normal | Git log |
| `<leader>gp` | Normal | Git push |
| `<leader>gP` | Normal | Git pull |

**Available Commands:**
`:Git`, `:G`, `:Gdiffsplit`, `:Gvdiffsplit`, `:Gread`, `:Gwrite`, `:Ggrep`, `:GMove`, `:GDelete`, `:GBrowse`, `:GRemove`, `:GRename`, `:Glgrep`, `:Gedit`

#### LazyGit

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | Normal | Open LazyGit |

**Available Commands:**
`:LazyGit`, `:LazyGitConfig`, `:LazyGitCurrentFile`, `:LazyGitFilter`, `:LazyGitFilterCurrentFile`

---

### Yanky (Yank History)

Enhanced yank/paste with history.

| Key | Mode | Description |
|-----|------|-------------|
| `y` | Normal, Visual | Yank text |
| `p` | Normal, Visual | Put after cursor |
| `P` | Normal, Visual | Put before cursor |
| `gp` | Normal, Visual | Put after and move cursor to end |
| `gP` | Normal, Visual | Put before and move cursor to end |
| `[y` | Normal | Cycle forward through yank history |
| `]y` | Normal | Cycle backward through yank history |
| `<leader>y` | Normal, Visual | Open yank history in Telescope |

**Configuration:**
- History length: 100 entries
- Storage: shada (persists across sessions)
- Syncs with system clipboard
- Highlights on yank/put (500ms)
- Preserves cursor position

---

### nvim-surround

Quickly add, delete, or change surrounding characters.

#### Normal Mode

| Key | Action | Example |
|-----|--------|---------|
| `ys{motion}{char}` | Add surround | `ysiw"` → surround word with `"` |
| `ds{char}` | Delete surround | `ds"` → delete surrounding `"` |
| `cs{old}{new}` | Change surround | `cs"'` → change `"` to `'` |

#### Visual Mode

| Key | Action | Example |
|-----|--------|---------|
| `S{char}` | Surround selection | `S"` → `"selection"` |

**Note:** Using opening delimiters (`(`, `[`, `{`) adds spaces, closing delimiters (`)`, `]`, `}`) do not.

---

### nvim-autopairs

Automatic closing of brackets and quotes in insert mode.

| Typed | Result |
|-------|--------|
| `(` | `()` (cursor inside) |
| `[` | `[]` |
| `{` | `{}` |
| `'` | `''` |
| `"` | `""` |

**Disabled for filetypes:** `TelescopePrompt`, `vim`

---

### Which-Key Groups

Which-key shows available keybindings when you press a prefix key.

| Prefix | Group | Description |
|--------|-------|-------------|
| `<leader>b` | Buffers | Buffer management |
| `<leader>f` | File | File operations (Telescope) |
| `<leader>g` | Git | Git commands |
| `<leader>w` | Windows | Window management (proxy to `Ctrl+w`) |
| `<leader>s` | Surround | Surround operations |
| `<leader>sp` | Pairs | Autopairs operations |

---

## Netrw (File Explorer)

Netrw is Neovim's built-in file explorer.

### Opening Netrw

| Command | Description |
|---------|-------------|
| `:Ex` / `:Explore` | Open in current window |
| `:Sex` / `:Sexplore` | Open in horizontal split |
| `:Vex` / `:Vexplore` | Open in vertical split |
| `:Tex` / `:Texplore` | Open in new tab |
| `:Rex` / `:Rexplore` | Re-open last netrw browser |

### Navigation

| Key | Description |
|-----|-------------|
| `j` / `k` | Move cursor down / up |
| `Enter` | Open file or enter directory |
| `-` | Go to parent directory |
| `u` | Go to previous directory in history |
| `U` | Go to next directory in history |
| `gh` | Toggle hidden files |
| `c` | Change browsing directory to cursor location |

### Opening Files

| Key | Action |
|-----|--------|
| `Enter` | Open in current window |
| `t` | Open in new tab |
| `o` | Open in horizontal split |
| `v` | Open in vertical split |
| `p` | Preview file |
| `P` | Open file, keep cursor in netrw |

### File Operations

| Key | Action |
|-----|--------|
| `%` | Create new file |
| `d` | Create new directory |
| `R` | Rename file/directory |
| `D` | Delete file/directory |
| `x` | Execute file |

### Marking & Bulk Operations

| Key | Action |
|-----|--------|
| `mf` | Mark file |
| `mF` | Unmark file |
| `ma` | Mark all files |
| `mA` | Unmark all files |
| `mt` | Set target directory |
| `mc` | Copy marked files to target |
| `mm` | Move marked files to target |

**Workflow:** Navigate to destination → `mt` → Navigate to source → `mf` (mark files) → `mc` (copy) or `mm` (move)

### View Options

| Key | Description |
|-----|-------------|
| `s` | Cycle sort style (name, time, size) |
| `i` | Cycle view style (thin, long, tree) |
| `S` | Toggle banner |
| `gh` | Toggle hidden files |

### Misc

| Key | Description |
|-----|-------------|
| `q` | Close netrw |
| `qf` | Open quickfix list |

---

## Autocommands

Autocommands are defined in `lua/config/autocmds.lua`.

### Yank Highlighting
- Briefly highlights yanked text for visual feedback
- Works automatically with `yap`, `yiw`, etc.

### File Reload
- Automatically checks if file changed on disk when Neovim gains focus

### Cursor Position
- Restores cursor to last position when reopening a file
- Excluded for commit and rebase files

### Cursor Line
- Shows cursor line only in active window
- Hides cursor line when leaving window or entering insert mode

### Quick Close Windows
Press `q` to quickly close these window types:
- Help, Man pages
- Quickfix, Location list
- Git (fugitive, floggraph)
- LSP info
- Toggleterm
- And more...

### Filetype-Specific Indentation

| Filetype | Tab Width |
|----------|-----------|
| Python | 4 spaces |
| HTML, CSS, SCSS, Less, JavaScript, TypeScript | 2 spaces |

### Custom Commands

| Command | Description |
|---------|-------------|
| `:GitBlameLine` | Print git blame for current line |

---

## Colorschemes

Available colorschemes (configured in `lua/plugins/colorscheme.lua`):

| Colorscheme | Status | Style |
|-------------|--------|-------|
| **tokyonight** | Active (default) | Moon style, transparent |
| catppuccin | Available | Transparent |
| cyberdream | Available | Transparent |
| nord | Available | Default |

To switch colorscheme, use `:colorscheme <name>` or modify `colorscheme.lua`.

---

## Installed Plugins

### Core
- **lazy.nvim** - Plugin manager
- **plenary.nvim** - Utility functions (dependency)

### UI
- **lualine.nvim** - Status line
- **which-key.nvim** - Keybinding help popup
- **nvim-web-devicons** - File icons

### Editing
- **nvim-surround** - Add/change/delete surroundings
- **nvim-autopairs** - Auto-close brackets/quotes
- **yanky.nvim** - Enhanced yank with history

### Completion
- **nvim-cmp** - Completion engine
- **cmp-nvim-lsp** - LSP source
- **cmp-buffer** - Buffer words source
- **cmp-path** - Path completion source
- **cmp_luasnip** - Snippet source
- **LuaSnip** - Snippet engine
- **lspkind.nvim** - Completion icons

### LSP
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/DAP/Formatter installer
- **mason-lspconfig.nvim** - Bridge between Mason and lspconfig

### Git
- **vim-fugitive** - Git commands
- **lazygit.nvim** - LazyGit integration

### Search
- **telescope.nvim** - Fuzzy finder
- **telescope-ui-select.nvim** - UI select extension

### Syntax
- **nvim-treesitter** - Syntax highlighting and parsing

**Treesitter Parsers Installed:**
lua, javascript, typescript, python, vue, html, css, json, bash, yaml, markdown, markdown_inline, vimdoc, query, xml, terraform, hcl, groovy

---

## Tips

1. **Leader Key Reference:** Press `Space` and wait to see all available leader keybindings via which-key
2. **LSP Capabilities:** Use `K` to hover over any symbol for documentation
3. **Search:** Use `<leader>fg` for project-wide search with live preview
4. **Git:** Use `<leader>gg` for full-featured Git UI via LazyGit
