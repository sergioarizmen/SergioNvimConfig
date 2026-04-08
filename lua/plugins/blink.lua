-----------------------------------------------------------
-- Blink cmp configuration file
-----------------------------------------------------------
-- Plugin: blink.cmp
-- url: https://github.com/saghen/blink.cmp

-- Check if the plugin is properly installed.
local status_ok, blink_cmp = pcall(require, "blink.cmp")
if not status_ok then
    return
end

-- Call setup.
blink_cmp.setup({
    keymap = {
        -- "default" (recommended) for mappings similar to built-in completions:
        --   <c-y> to accept ([y]es) the completion.
        --    This will expand snippets if the LSP sent a snippet.
        -- "super-tab" for tab to accept.
        -- "enter" for enter to accept.
        -- "none" for no mappings.
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion.
        -- <c-space>: Open menu or open docs if already open.
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item.
        -- <c-e>: Hide menu.
        -- <c-k>: Toggle signature help.
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap.
        preset = "default",
        ["<Enter>"] = { "accept", "fallback" },
    },

    appearance = {
        -- Adjusts spacing to ensure icons are aligned.
        -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font".
        nerd_font_variant = "mono",
    },

    completion = {
        -- By default, press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },

    sources = {
        -- default = { "lsp", "path", "snippets", "buffer" }.
        default = { "lsp", "path", "snippets", "lazydev", "buffer" },
        providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
    },

    snippets = { preset = "luasnip" },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    -- See :h blink-cmp-config-fuzzy for more information.
    fuzzy = { implementation = "prefer_rust_with_warning" },

    -- Shows a signature help window while typing arguments for a function.
    signature = { enabled = true },
})
