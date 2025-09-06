-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included.
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables.
local opt = vim.opt   -- Set options (global/buffer/windows-scoped).

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = "unnamedplus"   -- Copy/paste to system clipboard.
opt.swapfile = false            -- Don't use swapfile.
opt.completeopt = "menuone,noinsert,noselect"   -- Autocomplete options.
opt.spell = true                -- Activate spell checker.
opt.timeout = true              -- Sets a timeout on commands.
opt.timeoutlen = 1000           -- Sets the wait time until command timeout.
opt.ignorecase = true           -- Ignore case letters when searching.
opt.smartcase = true            -- Make patterns case sensitive if uppercase.
opt.mouse = "a"                 -- Enable all mouse modes.
opt.undofile = true             -- Save undo information to a separate file.

-- Go to previous/next line when cursor reaches end/beginning of line.
opt.whichwrap:append "<>[]hl"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.laststatus = 3              -- Only display status line on last window.
opt.number = true               -- Show line number.
opt.numberwidth = 2             -- Set minimum line number length.
opt.ruler = false               -- Disable cursor number on line number.
opt.relativenumber = false      -- Disable relative line number.
opt.scrolloff = 30              -- Set window scroll range to 30 line.
opt.showmode = false            -- Hide mode display.
opt.showmatch = true            -- Highlight matching parenthesis.
opt.colorcolumn = "80"          -- Line length marker at 80 columns.
opt.splitright = true           -- Vertical split to the right.
opt.splitbelow = true           -- Horizontal split to the bottom.
opt.termguicolors = true        -- Enable 24-bit RGB colors.
opt.signcolumn = "yes"          -- Always display sign column.
opt.statuscolumn = nil          -- Set status column to empty.
opt.wrap = false                -- Disable word wrap.
opt.cursorline = true           -- Highlight cursor line.
opt.cursorlineopt = "number"    -- Set line highlight to the number.
opt.splitkeep = "screen"        -- Keep cursor on same line after split screen.
opt.fillchars = { eob = " " }   -- Use empty space to fill end-of-buffer space.

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true    -- Use spaces instead of tabs.
opt.shiftwidth = 4      -- Shift 4 spaces when tab.
opt.tabstop = 4         -- 1 tab == 4 spaces.
opt.smartindent = true  -- Autoindent new lines.

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true       -- Enable background buffers.
opt.history = 100       -- Remember N lines in history.
opt.lazyredraw = true   -- Faster scrolling.
opt.synmaxcol = 240     -- Max column for syntax highlight.
opt.updatetime = 700    -- ms to wait for trigger an event.

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro.
opt.shortmess:append "sI"

-- Disable some default providers.
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Disable builtin plugins.
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
