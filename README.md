# Sergio's Neovim Configuration

Remember `:Tutor` helps you learn the basic vim editor configurations.

## Custom Key Mappings

> The `<leader>` key is set to `,`.

### 1. General Shortcuts
- `<CR>`: Create a new line below in normal mode.
- `<C-s>`: Save file (`:w`).
- `<C-c>`: Copy whole file to clipboard.
- `<C-{h,j,k,l}>`: Navigate between splits.
- `<C-{up,down,left,right}>`: Resize windows.
- `J` / `K` (Visual): Move selected lines down/up.
- `<leader>p` (Visual): Paste and keep current clipboard content.

### 2. Search Category (`<leader>s`)
Standardized fuzzy search via **Snacks.nvim** and global replace via **Spectre**.
- `<leader>sf`: [S]earch [F]iles
- `<leader>sg`: [S]earch [G]rep (Live Grep)
- `<leader>sb`: [S]earch [B]uffers
- `<leader>sh`: [S]earch [H]elp
- `<leader>sk`: [S]earch [K]eymaps
- `<leader>sd`: [S]earch [D]iagnostics
- `<leader>st`: [S]earch [T]odo
- `<leader>sw`: [S]earch [W]ord
- `<leader>s.`: [S]earch Recent Files
- `<leader>ss`: [S]earch [S]pectre (Toggle global search/replace UI)
- `<leader>sr`: [S]earch & [R]eplace (Standard core regex replace)

### 3. Git Category (`<leader>g`)
Integrated Git actions via **Snacks.nvim** and **Gitsigns**.
- `<leader>gg`: [G]it [G]it (Open Lazygit)
- `<leader>gs`: [G]it [S]tage hunk
- `<leader>gr`: [G]it [R]eset hunk
- `<leader>gp`: [G]it [P]review hunk
- `<leader>gb`: [G]it [B]lame line
- `<leader>gd`: [G]it [D]iff
- `]c` / `[c`: Jump to next/prev git change.

### 4. Code & LSP Category (`<leader>c`)
Essential code actions and navigation.
- `<leader>ca`: [C]ode [A]ction
- `<leader>cr`: [C]ode [R]ename
- `<leader>cd`: [C]ode [D]iagnostics (floating window)
- `<leader>cf` or `<leader>f`: [C]ode [F]ormat
- `<leader>co`: [C]ode [O]utline (Toggle Aerial)
- `<leader>cs`: [C]ode [S]ymbols (Document)
- `<leader>cS`: [C]ode [S]ymbols (Workspace)
- `gd`: Go to Definition
- `gr`: Go to References
- `gI`: Go to Implementation
- `gt`: Go to Type Definition
- `K`: Hover documentation

### 5. UI & Toggles Category (`<leader>u`)
Centralized toggles for interface elements.
- `<leader>ul`: Toggle [L]ine numbers
- `<leader>ur`: Toggle [R]elative numbers
- `<leader>uc`: [U]I [C]lear highlights
- `<leader>un`: [U]I [N]otifications (Dismiss all)
- `<leader>uh`: [U]I Toggle [H]ints (Inlay)
- `<leader>ub`: [U]I Toggle git [B]lame list
- `<leader>ua`: [U]I [A]lpha (Dashboard)
- `<leader>um`: [U]I [M]arkdown Preview

### 6. Explorer Category
- `<leader>e`: Toggle [E]xplorer (NvimTree)
- `<leader>o`: Open [O]il (File editing)

### 7. Actions & Motions
- **Flash Search**: Press `s` to start a flash search.
- **Surround**: `cs`, `ds`, `ys` for changing/deleting/adding surroundings.
- **Comments**: `gcc` to comment line, `gc` (Visual) to comment block.

---
*Remember that `g?` or `?` within most windows (NvimTree, Oil, Snacks Picker) will show context-aware help.*


