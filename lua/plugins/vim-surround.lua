-----------------------------------------------------------
-- Vim surround configuration file.
----------------------------------------------------------
--
-- Plugin: vim-surround
-- url: https://github.com/tpope/vim-surround

-- Check if the plugin is properly installed.
local status_ok, vim_surround = pcall(require, "vim-surround")
if not status_ok then
    return
end

vim_surround.setup()
