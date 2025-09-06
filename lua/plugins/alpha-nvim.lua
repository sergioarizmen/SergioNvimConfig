-----------------------------------------------------------
-- Alpha plugin configuration file
-----------------------------------------------------------
-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim
-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16

-- Check if the plugin is properly installed.
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Set startup banner.
dashboard.section.header.val = {
    "Our neovim; Who art in iTerm",
    "Hallowed be thy keybinds",
    "Thy command come; thy will be done",
    "On Terminal, as it is in VSCode",
    "Give us this completion, our daily code",
    "And forgive us of using arrow keys; as we forgive those who use them against us",
    "And lead us not into IDEs; but deliver us from all mouse usage",
    "Amen"
}

-- Set buttons.
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("gr", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("s", "  Settings", ":cd $USERPROFILE/AppData/Local/nvim<CR> :e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Set the footer.
-- Define VIM related parameters.
local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch
local datetime = os.date(" %d-%m-%Y 󱑏 %H:%M:%S")

-- Create a command that updates the footer when Lazy is done loading.
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
            "",
            "",
            version,
            "",
            datetime,
            "",
            "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms",
        }
        pcall(vim.cmd.AlphaRedraw)
    end,
})

-- Set the default footer as empty.
dashboard.section.footer.val = {}
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

-- Set dashboard to neglect other auto commands.
dashboard.opts.opts.noautocmd = true

-- Setup alpha.
alpha.setup(dashboard.opts)

-- Add an open key map.
vim.keymap.set("n", "<leader>a", ":Alpha<CR>")
