-----------------------------------------------------------
-- Specter plugin configuration file.
-----------------------------------------------------------
--
-- Plugin: nvim-spectre
-- url: https://github.com/nvim-pack/nvim-spectre

-- Check if the plugin is properly installed.
local status_ok, nvim_spectre = pcall(require, "nvim-spectre")
if not status_ok then
    return
end

-- Call setup.
nvim_spectre.setup()

-- Setup key maps.
vim.keymap.set('n', '<leader>S', nvim_spectre.toggle(), { desc = "Toggle Spectre", noremap = true, silent = true })
vim.keymap.set('n', '<leader>sw', nvim_spectre.open_visual({select_word=true}), { desc = "Search current word", noremap = true, silent = true })
vim.keymap.set('v', '<leader>sw', nvim_spectre.open_visual(), { desc = "Search current word", noremap = true, silent = true })
vim.keymap.set('n', '<leader>sp', nvim_spectre.open_file_search({select_word=true}), { desc = "Search on current file", noremap = true, silent = true })
