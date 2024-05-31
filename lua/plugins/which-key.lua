-----------------------------------------------------------
-- Wich-key configuration file.
----------------------------------------------------------
--
-- Plugin: which-key
-- url: https://github.com/folke/which-key.nvim

-- Check if the plugin is properly installed.
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- Call setup.
which_key.setup()
