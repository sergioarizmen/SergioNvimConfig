-----------------------------------------------------------
-- Treesitter configuration file.
----------------------------------------------------------
--
-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

-- Check if the plugin is properly installed.
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup({
    modules = {},
    ensure_installed = { "lua", "vim", "python", "markdown_inline", "javascript", "css", "html" },
    highlight = {
        enable = true,
        disable = { "c", "rust" },
    },
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    context_commentstring = {
        enable = true,
        autocmd = false
    },
    autopairs = {
        enable = true
    },
    autotag = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { "go" }
    }
})

