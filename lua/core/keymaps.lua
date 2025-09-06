-----------------------------------------------------------
-- Keymap Definitions
-----------------------------------------------------------

local function map(mode, lhs, rhs)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma.
vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Move in insert mode.
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Clear search highlighting with <leader> and c.
map("n", "<leader>c", "<cmd>nohl<CR>", { desc = "clear highlighting" })

-- Move around splits using Ctrl + {h,j,k,l}.
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Hole file commands.
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Create new line in normal mode.
map("n", "<CR>", "o<Esc>", { desc = "create new line" })

-- Change line number settings.
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Keep copied content as is after paste.
map("x", "<leader>p", "\"_dP", { desc = "copy and keep content" })

-- Adds an automatic replace functionality.
map("n", "<leader>s", [[\<cmd\>%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "automatic replace" })

-- Resize windows.
map("n", "<C-up>", "<cmd>resize -2<cr>", { desc = "reduce vertial window size" })
map("n", "<C-down>", "<cmd>resize +2<cr>", { desc = "increase vertial window size" })
map("n", "<C-left>", "<cmd>vertical resize -2<cr>", { desc = "reduce horizontal window size" })
map("n", "<C-right>", "<cmd>vertical resize +2<CR>", { desc = "increase horizontal window size" })

-- Display error diagnostics on <leader> and e.
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>",
    { desc = "display error diagnostics" })

-- Move lines around.
map("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "move line down" })
map("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "move line up" })

-- Terminal mappings.
map("n", "<C-t>", "<cmd>Term<CR>", { desc = "open terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "close terminal" })

