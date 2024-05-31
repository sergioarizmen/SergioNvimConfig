# Sergio's Neovim Configuration

Remember `:Tutor` helps you learn the basic vim editor configurations.

## Custom Key Mappings

> The `<leader>` key is set to `,`.

- In normal mode, `,c` clears any highlights.
- In normal mode, `<CR>` creates a new line below.
- In normal mode, `<C-{h,j,k,l}>` will result in the same command as `<C-w>{h,j,k,l}`.
- In normal mode, `<C-{up,down,left,right}>` will result in the current window expanding in the selected direction.
- In visual mode, `J` will move the selected lines down.
- In visual mode, `K` will move the selected lines up.
- In insert mode, `{<CR>`, `[<CR>`, and `(<CR>` will result in two new lines with the corresponding sign closed.
- In normal mode, `<C-t>` will open the terminal.
- In terminal mode, `<Esc>` will close the terminal.

## Plugin Commands & Key Maps

### vim-startuptime

Plugin used to measure plugin loading times' and overall Neovim loading slowdowns.

- Use `:StartupTime` to measure the total time each plugin takes to load.

### nvim-treesitter/nvim-treesitter

Adds advanced highlighting and motions for installed languages.

- Use `:TSInstall <language_to_install>` to install any missing treesitter languages.

### folke/todo-comments.nvim

Highlights "TODO" comments and adds "TODO" comment quick search functionality.

- Use `:TodoQuickFix` display all "TODO" comments in the project.
- Use `:TodoTelescope` to open the search for "TODO" comments. (see [telescope](#nvim-telescope%2Ftelescope.nvim))

> Mark comments starting them with the keyword: `TODO:`, `FIX:`, or `HACK:`.

### tpope/vim-fugitive

Adds support for git commands within Neovim's command line.

- Use `:Git` to call any git command from within Neovim.

### iamcco/markdown-preview.nvim

Adds markdown previews on browsers.

- Use `:MarkdownPreviewToggle` to toggle the markdown preview.
- Use `:MarkdownPreview` to open a markdown preview.
- Use `:MarkdownPreviewStop` to close the markdown preview.

### lewis6991/gitsigns.nvim

Adds blame display per line.

- Use `:Gitsigns` to access all functionality.
- Use `:Gitsigns toggle_current_line_blame` to toggle blame display on each line.

### goolord/alpha-nvim

Plugin used to configure a startup window with multiple features.

- In normal mode, `,a` opens the startup window.

### nvim-tree/nvim-tree.lua

Provides a configurable directory tree view.

- In normal mode, `<C-n>` toggles the tree-explorer window.
- With the tree-explorer window selected, `g?`opens the key maps display window.

### nvim-telescope/telescope.nvim

Provides a fuzzy search window.

- In normal mode, `<C-p>` opens the telescope finder.
- In normal mode, `,r` opens the search for previously opened files.
- In normal mode, `,gr` opens the search for text within files.
- In normal mode, `,fj` opens the search for previously opened help tags.
- In normal mode, `?` opens the key maps display window.
- In normal mode, `<Esc>` closes the telescope window.

### stevearc/oil.nvim

Adds a file system editing window, allowing text editing on file systems.

- In normal mode, `-` opens the oil editing window.
- With the oil window open, in normal mode, `g?` opens the key maps display window.

> The following commands are disabled: `<C-h>`, `<C-t>`, `<C-p>`, and `<C-l>`.

### ThePrimeagen/harpoon

Adds quick access to commonly used files.

- In normal mode, `<C-e>` opens the quick access menu.
- In normal mode, `,h` adds the current file to the quick access list.
- In normal mode, `,{1-9}` opens the corresponding quick access file.

### numToStr/Comment.nvim

Adds quick commenting key maps. Integrates with [treesitter]() motions.

- In normal mode, `gcc` toggles the current line using linewise comment.
- In normal mode, `gbc` toggles the current line using blockwise comment.
- In normal mode, `[count]gcc` toggles the number of line given as a prefix-count using linewise.
- In normal mode, `[count]gbc` toggles the number of line given as a prefix-count using blockwise.
- In normal mode, `gc[count]{motion}` toggles the region using linewise comment.
- In normal mode, `gb[count]{motion}` toggles the region using blockwise comment.
- In visual mode, `gc` toggles the region using linewise comment.
- In visual mode, `gb` toggles the region using blockwise comment.
- In normal mode, `gco` insert comment to the next line and enters INSERT mode.
- In normal mode, `gcO` insert comment to the previous line and enters INSERT mode.
- In normal mode, `gcA` insert comment to end of the current line and enters INSERT mode.

### tpope/vim-surround

Adds quick surrounding key maps.

- In normal mode, `cs{current}{replacement}` replaces the surrounding text `{current}` with the text `{replacement}`.
- In normal mode, `ds{current}` removes the surrounding text `{current}`.
- In normal mode, `ysiw[count]{surrounding}` adds `{surrounding}` text to a given `count` of words.
- In normal mode, `yss{surrounding}` adds `{surrounding}` text to the entire line.

> Use `t` for `cs` and `ds` commands as `{current}` to easily replace/remove tags.

### folke/flash.nvim

Adds flash search key maps.

- In normal, visual, and operator missing modes, `s` to enable flash search.
