local status_ok, noice = pcall(require, "noice")
if not status_ok then
    return
end

noice.setup({
    cmdline = {
        -- Use the "cmdline" view for the command line (at the bottom)
        -- instead of the default "cmdline_popup" (in the center).
        view = "cmdline",
    },
    lsp = {
        -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.set_overline"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- You can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
})
