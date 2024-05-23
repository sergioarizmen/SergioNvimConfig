-----------------------------------------------------------
-- Telescope plugin configuration file.
-----------------------------------------------------------
--
-- Plugin: telescope
-- url: https://github.com/nvim-telescope/telescope.nvim

-- Check if the plugin is properly installed.
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup()
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>r", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>gr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fj", builtin.help_tags, {})
