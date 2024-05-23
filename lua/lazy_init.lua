-- Install dependancies.
-- Add lazynvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
	    lazypat2,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Define the plugins and the options required.
local lazy_plugins = require("lazy_plugins")
local lazy_options = {}

-- Start requiring setup.
require("lazy").setup(lazy_plugins, lazy_options)
