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

### Mason

Adds an easy to use LSP installer.

- Use `:Mason` to open the use Mason LSP menu.

### tpope/vim-abolish

Adds a case sensitive replacement command.
Works like the `:s[ubstitute]` command.

- Use `:[range]S[ubvert]/{pattern}/{string}/[flags] [count]` to replace case sensitively the matched `pattern` with the matched `string`.
    For example, `:%S/facilit{y,ies}/building{,s}/g` will replace any of the following: facility, facilities, Facility, Facilities, FACILITY, FACILITIES, etc.
    for its corresponding match: building, buildings, Building, Buildings, BUILDING, BUILDINGS, etc.

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
- In normal mode, `,]` opens the search for references of the word under the cursor.
- In normal mode, `,u` opens the undo telescope tree.
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
- In normal mode, `ysi[count]w{surrounding}` adds `{surrounding}` text to a given `count` of words.
- In normal mode, `yss{surrounding}` adds `{surrounding}` text to the entire line.

> Use `t` for `cs` and `ds` commands as `{current}` to easily replace/remove tags.

### folke/flash.nvim

Adds flash search key maps.

- In normal, visual, and operator missing modes, `s` to enable flash search.

### stevearc/aerial.nvim

Adds a view of functions, classes, and other relevant elements within the current buffer.

- In normal mode, `,z` will open the aerial view.
- In normal mode, `<c-[>` will traverse to the previous relevant element.
- In normal mode, `<c-]>` will traverse to the next relevant element.

### nvim-pack/nvim-spectre

Use command: :Spectre

    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popupwhich-key

### LSP

K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().

gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().

go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().

gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().

gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().

<F3>: Format code in current buffer. See :help vim.lsp.buf.format().

<F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().

gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().

[d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().

]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

### CMP


