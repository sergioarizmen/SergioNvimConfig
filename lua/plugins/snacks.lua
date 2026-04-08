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

-- Call setup.
snacks.setup({
    bigfile = { enabled = true },
    dashboard = {
        enabled = false,
        preset = {
            header = [[
                                              
       ████ ██████           █████      ██
      ███████████             █████ 
      █████████ ███████████████████ ███   ███████████
     █████████  ███    █████████████ █████ ██████████████
    █████████ ██████████ █████████ █████ █████ ████ █████
  ███████████ ███    ███ █████████ █████ █████ ████ █████
 ██████  █████████████████████ ████ █████ █████ ████ ██████
            ]],
        },
        sections = {
            { section = "header" },
            { section = "keys", indent = 1,gap = 1, padding = 1 },
            { section = "recent_files", icon = " ", title = "Recent Files", cwd = true, indent = 3, padding = 2 },
            -- { icon = " ", title = "Projects", section = "projects", indent = 3, padding = 2 },
            { section = "startup" },
            { pane = 2, padding = 2 },
            {
                pane = 2,
                section = "terminal",
                -- cmd = "~/.config/nvim/img/ascii-image-converter ~/.config/nvim/img/CodeOpsHQLogoWithLightBackgraung.jpg -c -b --dither",
                cmd = "~/.config/nvim/img/ascii-image-converter ~/.config/nvim/img/logo.jpg -c -b --dither",
                random = 10,
                indent = 4,
                height = 30,
            }
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

-- Lazygit keymaps.
map("n", "<leader>lg", function() Snacks.lazygit() end, "[L]azy[G]it")

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
map("n", "<leader>ss", function() Snacks.picker.smart() end, "Smart Find Files")
map("n", "<leader><space>", function() Snacks.picker.buffers() end, "[ ] Find existing buffers")
map("n", "<leader>sg", function() Snacks.picker.grep() end, "[S]earch by [G]rep")
map("n", "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, "[S]earch [N]eovim files")
map("n", "<leader>sf", function() Snacks.picker.files() end, "[S]earch [F]iles")
map("n", "<leader>sp", function() Snacks.picker.pickers() end, "[S]earch [P]ickers")
map("n", "<leader>s.", function() Snacks.picker.recent() end, "[S]earch Recent Files ('.' for repeat)")
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, "[S]earch [K]eymaps")
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, "[S]earch current [W]ord")
map("n", "<leader>sr", function() Snacks.picker.resume() end, "[S]earch [R]esume")
map("n", "<leader>sh", function() Snacks.picker.help() end, "[S]earch [H]elp")
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, "[S]earch [D]iagnostics")
map("n", "<leader>s/", function() Snacks.picker.grep_buffers() end, "[S]earch [/] in Open Files")
map("n", "<C-p>", function() Snacks.picker.files() end, "Find Files")
map("n", "<leader>r", function() Snacks.picker.recent() end, "Recent Files")
map("n", "<leader>]", function() Snacks.picker.lsp_references() end, "LSP References")
map("n", "<leader>gr", function() Snacks.picker.grep() end, "Live Grep")
map("n", "<leader>fj", function() Snacks.picker.help() end, "Help Tags")
map("n", "<leader>u", function() Snacks.picker.undo() end, "Undo History")
map("n", "<leader>st", function() Snacks.picker.todo() end, "Todo Comments")
map("n", "<leader>/",
    function()
        Snacks.picker.lines({
            -- Use the Select layout.
            layout = {
                preset = "select",
            },
        })
    end,
    "[/] Fuzzily search in current buffer"
)
