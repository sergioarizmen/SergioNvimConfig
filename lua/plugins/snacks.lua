-----------------------------------------------------------
-- Snacks configuration file
-----------------------------------------------------------
-- Plugin: snacks.nvim
-- url: https://github.com/folke/snacks.nvim

-- Check if the plugin is properly installed.
local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
    return
end

-- Get vim version.
local v = vim.version()
local version = "v" .. v.major .. "." .. v.minor .. "." .. v.patch

-- Call setup.
snacks.setup({
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        preset = {
            header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]],
            keys = {
                { icon = " ", key = "e", desc = "New file", action = ":ene | startinsert" },
                { icon = " ", key = "r", desc = "Recently used files", action = ":lua Snacks.picker.recent()" },
                { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.picker.files()" },
                { icon = " ", key = "g", desc = "Find text", action = ":lua Snacks.picker.grep()" },
                { icon = " ", key = "s", desc = "Settings", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "q", desc = "Quit Neovim", action = ":qa" },
            },
        },
        sections = {
            -- Left pane.
            { section = "header" },
            { section = "keys", indent = 1, gap = 1, padding = 1 },
            { section = "startup", padding = 1 },
            {
                padding = 2,
                align = "center",
                text = {
                    { " " .. version, hl = "Special" },
                },
            },

            -- Right pane.
            { pane = 2, padding = 1 },
            { pane = 2, padding = 1 },
            { pane = 2, padding = 1 },
            { pane = 2, padding = 1 },
            { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
            {
                pane = 2,
                icon = " ",
                title = "Git Status",
                section = "terminal",
                enabled = function()
                    return Snacks.git.get_root() ~= nil
                end,
                cmd = "git status --short --branch --renames",
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },

        },
    },

    -- explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    -- input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    -- git = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    scratch = { enabled = true },
    -- statuscolumn = { enabled = true },
    terminal = { enabled = true },
    -- toggle = { enabled = true },
    words = { enabled = true },
})

-----------------------------------------------------------
-- Snacks keymaps
-----------------------------------------------------------

-- Get the custom utility map function.
local map = require("core.utils.map")

-- Dashboard keymap.
map("n", "<leader>ua", function() Snacks.dashboard.open() end, "[U]I [A] Dashboard")
map("n", "<C-a>", function() Snacks.dashboard.open() end, "Quick Access Dashboard")

-- Git keymaps.
map("n", "<leader>gg", function() Snacks.lazygit() end, "[G]it [G]it (Lazygit)")

-- Notifier keymaps.
map("n", "<leader>un", function() Snacks.notifier.hide() end, "Dismiss All Notifications")

-- Terminal keymaps.
map({"n", "t"}, "<c-/>", function() Snacks.terminal() end, "Toggle Terminal")
map("n", "<c-_>", function() Snacks.terminal() end, "which_key_ignore")

-- Words keymaps.
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, "Next Reference")
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, "Prev Reference")

-- Picker key maps.
map("n", "\\", function() Snacks.explorer() end, "File Explorer")
map("n", "<leader>ss", function() Snacks.picker.smart() end, "[S]earch [S]mart")
map("n", "<leader>sb", function() Snacks.picker.buffers() end, "[S]earch [B]uffers")
map("n", "<leader>sg", function() Snacks.picker.grep() end, "[S]earch by [G]rep")
map("n", "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, "[S]earch [N]eovim files")
map("n", "<leader>sf", function() Snacks.picker.files() end, "[S]earch [F]iles")
map("n", "<leader>sl", function() Snacks.picker.pickers() end, "[S]earch pickers [L]ist")
map("n", "<leader>s.", function() Snacks.picker.recent() end, "[S]earch Recent Files")
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, "[S]earch [K]eymaps")
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, "[S]earch current [W]ord")
map("n", "<leader>sR", function() Snacks.picker.resume() end, "[S]earch [R]esume")
map("n", "<leader>sh", function() Snacks.picker.help() end, "[S]earch [H]elp")
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, "[S]earch [D]iagnostics")
map("n", "<leader>s/", function() Snacks.picker.grep_buffers() end, "[S]earch [/] in Open Files")
map("n", "<leader>su", function() Snacks.picker.undo() end, "[S]earch [U]ndo History")
map("n", "<leader>st", function() Snacks.picker.todo() end, "[S]earch [T]odo Comments")

-- Common shortcuts
map("n", "<C-p>", function() Snacks.picker.files() end, "Find Files")
map("n", "<leader>/",
    function()
        Snacks.picker.lines({
            layout = {
                preset = "select",
            },
        })
    end,
    "[/] Fuzzily search in current buffer"
)
