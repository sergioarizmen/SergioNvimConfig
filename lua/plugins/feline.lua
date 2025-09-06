-----------------------------------------------------------
-- Feline status line configuration
-----------------------------------------------------------
-- Plugin: feline.nvim
-- url: https://github.com/feline-nvim/feline.nvim

-- Check if the plugin is properly installed.
local status_ok, feline = pcall(require, "feline")
if not status_ok then
    return
end

-- Enable basic setup.
feline.setup()

-- Enable window header.
feline.winbar.setup()
