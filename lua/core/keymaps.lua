-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma.
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts.
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c.
map('n', '<leader>c', ':nohl<CR>')

-- Remaps to facilitate editing functions, lists or parameters.
map('i', '{<CR>', '{<CR>}<C-o>O', {noremap = true})
map('i', '[<CR>', '[<CR>]<C-o>O', {noremap = true})
map('i', '(<CR>', '(<CR>)<C-o>O', {noremap = true})

-- Move around splits using Ctrl + {h,j,k,l}.
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Create new line in normal mode.
map('n', '<CR>', 'o<Esc>')

-- Resize windows.
map('n', '<C-up>', ':resize -2<cr>')
map('n', '<C-down>', ':resize +2<cr>')
map('n', '<C-left>', ':vertical resize -2<cr>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move lines around.
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Terminal mappings.
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open.
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit.

-- Alpha.
vim.keymap.set('n', '<leader>a', ':Alpha<CR>')      -- open.

-- NvimTree.
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close.
map('n', '<leader>r', ':NvimTreeRefresh<CR>')       -- refresh.
map('n', '<leader>f', ':NvimTreeFindFile<CR>')      -- search file.

-- Tagbar.
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close.
