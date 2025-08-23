-----------------------------------------------------------
-- Neodev plugin configuration file
-----------------------------------------------------------
-- Plugin: neodev
-- url: https://github.com/goolord/alpha-nvim

-- Check if the plugin is properly installed.
local status_ok, neodev = pcall(require, 'neodev')
if not status_ok then
    return
end

neodev.setup()
