-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommand and autocommand creation function aliases aliases.
-- See: h:api-autocmd, h:augroup
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group.
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand.

-- Create and fire a custom "User" event called "FilePost".
-- Fires exactly once, when the UI is ready and a real file buffer is present.
-- Snippet taken form https://github.com/NvChad/NvChad.
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
            vim.api.nvim_del_augroup_by_name "NvFilePost"

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})

                if vim.g.editorconfig then
                    require("editorconfig").config(args.buf)
                end
            end)
        end
    end,
})

-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Startup commands:
-- Move to user folder on startup.
-- autocmd('VimEnter', {
--     command = ":cd $USERPROFILE"
-- })

-- Editor settings:
-- Highlight on yank.
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
    end
})

-- Remove whitespace on save.
autocmd('BufWritePre', {
    pattern = '*',
    command = ":%s/\\s\\+$//e"
})

-- Settings for filetypes:
-- Disable line length marker.
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
    group = 'setLineLength',
    pattern = require('core.config.disable_line_length_marker'),
    command = 'setlocal cc=0'
})

-- Terminal settings:
-- Open a Terminal on the right tab.
autocmd('CmdlineEnter', {
    command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal.
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})
autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
})

-- Close terminal buffer on process exit.
autocmd('BufLeave', {
    pattern = 'term://*',
    command = 'stopinsert'
})
