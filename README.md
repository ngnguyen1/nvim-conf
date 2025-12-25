# NeoVim configuration setup

## Neovim Copilot + nvim-cmp Keymaps

### 1. Copilot Ghost Text (Inline AI Suggestions)

| Key | Action | Description / Use Case |
|-----|--------|-----------------------|
| **Ctrl + y** | Accept suggestion | Accept the entire Copilot ghost text suggestion. |
| **Ctrl + i** | Accept line | Accept only the current line of the suggestion. |
| **Ctrl + w** | Accept word | Accept suggestion **word by word** for precise control. |
| **Ctrl + j** | Next suggestion | Cycle forward through multiple Copilot suggestions. |
| **Ctrl + k** | Previous suggestion | Cycle backward through Copilot suggestions. |
| **Ctrl + d** | Dismiss suggestion | Hide the current ghost text if unwanted. |

> Note: Ghost text now appears automatically with `auto_trigger = true`.
> Manual trigger (`Ctrl + l`) is no longer needed.

---

### 2. nvim-cmp Completion Popup

| Key | Action | Description / Use Case |
|-----|--------|-----------------------|
| **Alt + Space** | Trigger completion menu | Show the CMP popup manually. Useful for triggering suggestions in strings or comments. |
| **Enter (CR)** | Confirm suggestion | Accept the currently selected item in the completion popup. |
| **Tab** | Next item / snippet jump | Moves to the next completion suggestion in the popup, or jumps to next snippet placeholder. |
| **Shift + Tab** | Previous item / snippet jump | Moves to the previous suggestion or snippet placeholder. |

---

### 3. Snippets

- Snippets are handled via `LuaSnip`.
- Expand placeholders with **Tab** / jump backward with **Shift + Tab**.
- Snippets can be extended later with additional snippet packs.

---

### 4. Summary

- **Copilot keys** → AI ghost text suggestions (inline).
- **nvim-cmp keys** → Completion popup with multiple sources (LSP, buffer, path, snippets, Copilot).
- Both systems work together seamlessly in insert mode.

## Surround & Autopairs Cheat Sheet

### nvim-surround

Normal mode:
- `ys{motion}{char}`  → add surround
- `ds{char}`          → delete surround
- `cs{old}{new}`      → change surround

Visual mode:
- `S{char}` → surround selection with `{char}`
  - `S"` → "word"
  - `S'` → 'word'
  - `S(` → (word)

### nvim-autopairs

Insert mode:
- `(` → `()` (cursor inside)
- `[` → `[]`
- `{` → `{}`
- `'` → `''`
- `"` → `""`

> Note: Surrounding with an opening delimiter (e.g., `(`) will add a space before/after the selection, while surrounding with the closing delimiter (e.g., `)`) will not include the spaces.

## Netrw Basic Commands

> Open netrw with `:Ex`, `:Explore`, or by opening a directory: `nvim .`

---

### Opening Netrw

| Command              | Description                          |
| -------------------- | ------------------------------------ |
| `:Ex` / `:Explore`   | Open netrw in the current window     |
| `:Sex` / `:Sexplore` | Open netrw in a **horizontal split** |
| `:Vex` / `:Vexplore` | Open netrw in a **vertical split**   |
| `:Tex` / `:Texplore` | Open netrw in a **new tab**          |
| `:Rex` / `:Rexplore` | Re-open the last netrw browser       |

---

### Navigation

| Key       | Description                                       |
| --------- | ------------------------------------------------- |
| `j` / `k` | Move cursor down / up                             |
| `<CR>`    | Open file or enter directory                      |
| `-`       | Go up to the **parent directory**                 |
| `u`       | Go to **previous** directory in history           |
| `U`       | Go to **next** directory in history               |
| `gh`      | Toggle showing **hidden files**                   |
| `c`       | Change browsing directory to the one under cursor |

---

### Opening Files

With cursor on a file in netrw:

| Key    | Action                             |
| ------ | ---------------------------------- |
| `<CR>` | Open in the **current window**     |
| `t`    | Open in a **new tab**              |
| `o`    | Open in a **horizontal split**     |
| `v`    | Open in a **vertical split**       |
| `p`    | **Preview** file (preview window)  |
| `P`    | Open file but keep cursor in netrw |

---

### File & Directory Operations

With cursor on a file/directory:

| Key | Action                           |
| --- | -------------------------------- |
| `%` | Create a **new file**            |
| `d` | Create a **new directory**       |
| `R` | **Rename** file or directory     |
| `D` | **Delete** file or directory     |
| `x` | **Execute** file (if executable) |

---

### Marking & Bulk Operations

Mark files, set a target directory, then copy/move:

| Key  | Action                          |
| ---- | ------------------------------- |
| `mf` | **Mark** file                   |
| `mF` | **Unmark** file                 |
| `ma` | Mark **all** files              |
| `mA` | Unmark **all** files            |
| `mt` | Set **target directory**        |
| `mc` | **Copy** marked files to target |
| `mm` | **Move** marked files to target |

> Typical flow:
> 1. Go to destination dir → `mt`
> 2. Go to source dir → mark files with `mf` (or `ma`)
> 3. Use `mc` (copy) or `mm` (move)

---

### Sorting & View Options

| Key  | Description                                            |
| ---- | ------------------------------------------------------ |
| `s`  | Cycle **sort** style (name, time, size, etc.)          |
| `i`  | Cycle **view** style (thin list, long list, tree-like) |
| `S`  | Toggle netrw **banner**                                |
| `gh` | Toggle **hidden files**                                |

---

### Misc / Quit

| Key  | Description                                       |
| ---- | ------------------------------------------------- |
| `q`  | Close netrw window (or buffer)                    |
| `qf` | Open **quickfix** list for errors from operations |

## Yanky.nvim Keymaps

### Yank/Put Operations
| Key | Mode | Description |
|-----|------|-------------|
| `y` | Normal, Visual | Yank text |
| `p` | Normal, Visual | Put after cursor |
| `P` | Normal, Visual | Put before cursor |
| `gp` | Normal, Visual | Put after and move cursor |
| `gP` | Normal, Visual | Put before and move cursor |

### Cycle Through Yank History
| Key | Mode | Description |
|-----|------|-------------|
| `[y` | Normal | Cycle forward through yank history |
| `]y` | Normal | Cycle backward through yank history |

### Yank History Picker
| Key | Mode | Description |
|-----|------|-------------|
| `<leader>y` | Normal, Visual | Open yank history in Telescope |

