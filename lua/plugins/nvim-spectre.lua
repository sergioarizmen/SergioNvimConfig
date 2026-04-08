-----------------------------------------------------------
-- Specter plugin configuration file
-----------------------------------------------------------
-- Plugin: nvim-spectre
-- url: https://github.com/nvim-pack/nvim-spectre

-- Check if the plugin is properly installed.
local status_ok, nvim_spectre = pcall(require, "spectre")
if not status_ok then
    return
end

-- Call setup.
nvim_spectre.setup({})

-- Get the custom utility map function.
local map = require("core.utils.map")

-- Setup key maps.
map("n", "<leader>sp", function() nvim_spectre.toggle() end, "Toggle [S]earch with s[P]ectre")
