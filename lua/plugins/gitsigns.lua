-----------------------------------------------------------
-- Gitsigns configuration file
-----------------------------------------------------------
-- Plugin: gitsigns
-- url: https://github.com/lewis6991/gitsigns.nvim

-- Check if the plugin is properly installed.
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

-- Setup gitsigns.
gitsigns.setup({})
