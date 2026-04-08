-----------------------------------------------------------
-- Keymap Definitions
-----------------------------------------------------------

-- Get the custom utility map function.
map = require("core.utils.map")

-- Change leader to a comma.
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Move in insert mode.
map("i", "<C-b>", "<ESC>^i", "move beginning of line")
map("i", "<C-e>", "<End>", "move end of line")
map("i", "<C-h>", "<Left>", "move left")
map("i", "<C-l>", "<Right>", "move right")
map("i", "<C-j>", "<Down>", "move down")
map("i", "<C-k>", "<Up>", "move up")

-- Clear search highlighting with <leader> and c.
map("n", "<leader>c", "<cmd>nohl<CR>", "clear highlighting")

-- Move around splits using Ctrl + {h,j,k,l}.
map("n", "<C-h>", "<C-w>h", "switch window left")
map("n", "<C-l>", "<C-w>l", "switch window right")
map("n", "<C-j>", "<C-w>j", "switch window down")
map("n", "<C-k>", "<C-w>k", "switch window up")

-- Hole file commands.
map("n", "<C-s>", "<cmd>w<CR>", "general save file")
map("n", "<C-c>", "<cmd>%y+<CR>", "general copy whole file")

-- Create new line in normal mode.
map("n", "<CR>", "o<Esc>", "create new line")

-- Change line number settings.
map("n", "<leader>n", "<cmd>set nu!<CR>", "toggle line number")
map("n", "<leader>rn", "<cmd>set rnu!<CR>", "toggle relative number")
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", "toggle nvcheatsheet")

-- Keep copied content as is after paste.
map("x", "<leader>p", "\"_dP", "copy and keep content")

-- Adds an automatic replace functionality.
map("n", "<leader>s", [[\<cmd\>%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    "automatic replace")

-- Resize windows.
map("n", "<C-up>", "<cmd>resize -2<cr>", "reduce vertial window size")
map("n", "<C-down>", "<cmd>resize +2<cr>", "increase vertial window size")
map("n", "<C-left>", "<cmd>vertical resize -2<cr>", "reduce horizontal window size")
map("n", "<C-right>", "<cmd>vertical resize +2<CR>", "increase horizontal window size")

-- Display error diagnostics on <leader> and e.
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>",
    "display [e]rror diagnostics")

-- Display all diagnostic information as list.
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", "open diagnostic [q]uickfix list")

-- Move lines around.
-- NOTE: The explicit use of ":" rather than "<cmd>" is due so Nvim doesn't try to populate the "<>" as visual marks.
map("v", "J", "<Esc><cmd>m '>+1<CR>gv=gv", "move line down")
map("v", "K", "<Esc><cmd>m '<-2<CR>gv=gv", "move line up")

-- Terminal mappings.
map("n", "<C-t>", "<cmd>Term<CR>", "open terminal")
map("t", "<Esc>", "<C-\\><C-n>", "close terminal")
