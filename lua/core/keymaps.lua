-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
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
-- Neovim shortcuts.
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c.
map("n", "<leader>c", ":nohl<CR>")

-- Remaps to facilitate editing functions, lists or parameters.
map("i", "{<CR>", "{<CR>}<C-o>O")
map("i", "[<CR>", "[<CR>]<C-o>O")
map("i", "(<CR>", "(<CR>)<C-o>O")

-- Move around splits using Ctrl + {h,j,k,l}.
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Create new line in normal mode.
map("n", "<CR>", "o<Esc>")

-- Keep copied content as is after paste.
map("x", "<leader>p", "\"_dP")

-- Adds an automatic replace functionality.
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Resize windows.
map("n", "<C-up>", ":resize -2<cr>")
map("n", "<C-down>", ":resize +2<cr>")
map("n", "<C-left>", ":vertical resize -2<cr>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move lines around.
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Terminal mappings.
map("n", "<C-t>", ":Term<CR>")      -- open.
map("t", "<Esc>", "<C-\\><C-n>")    -- exit.
