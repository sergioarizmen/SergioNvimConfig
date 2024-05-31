-----------------------------------------------------------
-- Oil configuration file.
----------------------------------------------------------
--
-- Plugin: oil
-- url: https://github.com/stevearc/oil.nvim

-- Check if the plugin is properly installed.
local ok, oil = pcall(require, 'oil')
if not ok then
    return
end

oil.setup({
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        -- ["<C-h>"] = "actions.select_split",
        -- ["<C-t>"] = "actions.select_tab",
        -- ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        -- ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    },
})


vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
