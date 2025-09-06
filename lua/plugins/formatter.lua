-----------------------------------------------------------
-- Formatter configuration
-----------------------------------------------------------
-- Plugin: formatter.nvim
-- url: https://github.com/mhartington/formatter.nvim

-- Check if the plugin is properly installed.
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
    return
end

-- Setup the formatter.
formatter.setup()

-- Format(prettier).
vim.keymap.set("n", "<leader>l", ":Format<CR>")
