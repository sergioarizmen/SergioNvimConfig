-- Define the plugins and the options required.
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function() require("plugins.alpha-nvim") end
    },
    {
        "freddiehaddad/feline.nvim",
        opts = {},
        config = function() require("plugins.feline") end
    },
    {
		"nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugins.nvim-tree") end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSInstallInfo", "TSInstall" },
        config = function() require("plugins.nvim-treesitter") end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()  require("plugins.indent-blankline") end
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function ()
            local status_ok, comment = pcall(require, "Comment")

            if not status_ok then
                return
            end

            comment.setup()
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        -- @type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function ()
            local status_ok, telescope = pcall(require, "telescope")

            if not status_ok then
                return
            end

            telescope.setup()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>r", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>gr", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fj", builtin.help_tags, {})
        end
    },
    {
        'folke/neodev.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local neodev_status_ok, neodev = pcall(require, 'neodev')

            if not neodev_status_ok then
                return
            end

            neodev.setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = 'Mason',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            { 'williamboman/mason-lspconfig.nvim', },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'SmiteshP/nvim-navic' }
        },
        config = function()

            local lsp = require('lsp-zero').preset({})

            local navic = require('nvim-navic')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end)

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.ensure_installed({
                'pyright',
                'lua_ls',
                'gopls',
                'clangd'
            })

            lsp.setup()

            local cmp = require('cmp')
            -- local cmp_action = require('lsp-zero').cmp_action()

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                preselect = cmp.PreselectMode.None,
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                }
            })

        end
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    {
        'folke/todo-comments.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-telescope/telescope.nvim",
        },
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'tpope/vim-surround',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
    },
    {
        'iamcco/markdown-preview.nvim',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        config = function()
            vim.keymap.set('n', '<leader>m', '<Plug>MarkdownPreviewToggle', { desc = 'Markdown Preview' })
        end,
    },
    {
        'ThePrimeagen/harpoon',
        event = 'VimEnter',
        config = function ()

            local harpoon_status_ok, harpoon = pcall(require, 'harpoon')
            if not harpoon_status_ok then
                return
            end

            local harpoon_mark_status_ok, harpoon_mark = pcall(require, 'harpoon.mark')
            if not harpoon_mark_status_ok then
                return
            end

            local harpoon_ui_status_ok, harpoon_ui = pcall(require, 'harpoon.ui')
            if not harpoon_ui_status_ok then
                return
            end

            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap

            harpoon.setup({
                menu = {
                    width = 60,
                },
            })

            keymap.set('n', '<leader>h', harpoon_mark.add_file, opts)
            keymap.set('n', '<C-e>', harpoon_ui.toggle_quick_menu, opts)

            keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, opts)
            keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, opts)
            keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, opts)
            keymap.set('n', '<leader>4', function() harpoon_ui.nav_file(4) end, opts)
            keymap.set('n', '<leader>5', function() harpoon_ui.nav_file(5) end, opts)
            keymap.set('n', '<leader>6', function() harpoon_ui.nav_file(6) end, opts)
            keymap.set('n', '<leader>7', function() harpoon_ui.nav_file(7) end, opts)
            keymap.set('n', '<leader>8', function() harpoon_ui.nav_file(8) end, opts)
            keymap.set('n', '<leader>9', function() harpoon_ui.nav_file(9) end, opts)

        end,
    },
    {
        'stevearc/oil.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            local ok, oil = pcall(require, 'oil')

            if not ok then
                return
            end

            oil.setup({
                vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" }),

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
                -- Set to false to disable all of the above keymaps
                use_default_keymaps = false,
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function ()
            local status_ok, gitsigns = pcall(require, 'gitsigns')

            if not status_ok then
                return
            end

            gitsigns.setup({})
        end,
    },
    {
        'tpope/vim-fugitive',
        event = 'VimEnter',
    },
}
