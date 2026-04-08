-----------------------------------------------------------
-- Treesitter plugin configuration file
-----------------------------------------------------------
-- Plugin: treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

-- Check if the plugin is properly installed.
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- Call setup.
treesitter.setup({
    ensure_installed = {
        "bash", "c", "css", "diff", "html", "javascript", "lua", "luadoc", "markdown", "markdown_inline", "php", "python", "query", "regex", "rust", "vim", "vimdoc"
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true, disable = { "ruby" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<M-space>",
            node_incremental = "<M-space>",
            scope_incremental = false,
            node_decremental = "<Backspace>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>xs"] = { query = "@parameter.inner", desc = "Swap node with next" },
            },
            swap_previous = {
                ["<leader>xS"] = { query = "@parameter.inner", desc = "Swap node with previous" },
            },
        },
    },
})
