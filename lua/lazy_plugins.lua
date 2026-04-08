-- Define the plugins and the options required.
return {
    -- Adds a visual theme manager.
    -- VISUAL
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Adds web icons support.
    -- VISUAL
    {
        "nvim-tree/nvim-web-devicons",
    },

    -- Adds an autocompletion engine.
    -- Integrates with other autocompletion tools.
    -- CODE
    {
        "saghen/blink.cmp",
        event = "VeryLazy",
        version = "1.*",
        dependencies = {
            -- Adds snipet functionality.
            -- C compiler (gcc, clang, or zig) and make are required.
            -- CODE
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = "make install_jsregexp",
            },

            -- Adds a snippet collection.
            -- CODE
            "rafamadriz/friendly-snippets",

            -- Allows lazy updating workspace libraries.
            -- NEOVIM DEVELOPMENT, CODE
            "folke/lazydev.nvim",
        },
        config = function() require("plugins.blink") end
    },

    -- Adds Neovim"s default lsp configurations.
    -- CODE
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim.
            -- CODE
            { "mason-org/mason.nvim", opts = {} },

            -- Bridge between mason.nvim and lspconfig.
            -- CODE
            "mason-org/mason-lspconfig.nvim",

            -- Helps keep mason.nvim tools up to date.
            -- CODE
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Adds useful status updates for LSP.
            -- VISUAl, CODE
            { "j-hui/fidget.nvim", opts = {} },

            "saghen/blink.cmp",
        },
        config = function() require("plugins.mason") end
    },

    -- Adds a parser generator tool and an incremental parsing library.
    -- CODE
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        event = "VeryLazy",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        dependencies = {
            -- Adds syntax aware text-objects, select, move, swap, and peek support.
            -- CODE
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function() require("plugins.nvim-treesitter") end
    },

    -- Adds indentation visual indicators.
    -- VISUAL, CODE
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "User FilePost",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function() require("plugins.indent-blankline") end
    },

    -- Adds a notification manager.
    -- VISUAL
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function() require("plugins.nvim-notify") end
    },

    -- Adds a UI for messages, cmdline and the popupmenu.
    -- VISUAL
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- Adds UI components.
            -- VISUAL
            "MunifTanjim/nui.nvim",

            "rcarriga/nvim-notify",
        },
        config = function() require("plugins.noice") end
    },


    -- Adds special task comments" highlighting and search.
    -- CODE
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function() require("plugins.todo-comments") end
    },

    -- Adds visual indicators for who contributed with which line of code.
    -- VISUAL, CODE
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function() require("plugins.gitsigns") end
    },

    -- Adds fast comment key maps.
    -- CODE
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function () require("plugins.comment") end
    },

    -- Adds automatic parenthesis, quotes, and tag surrounding key maps.
    -- CODE
    {
        "tpope/vim-surround",
        event = "VeryLazy",
        config = function() require("plugins.vim-surround") end
    },

    -- Adds a case sensitive replacement command.
    -- CODE
    {
        "tpope/vim-abolish",
        event = "VeryLazy",
    },

    -- Adds a formatting command.
    -- CODE
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = { "ConformInfo" },
        config = function() require("plugins.conform") end
    },

    -- Adds a collection of small quality of life plugins.
    -- VISUAL, CODE
    {
        "folke/snacks.nvim",
        event = "VimEnter",
        config = function() require("plugins.snacks") end
    },

    -- Adds a directory search tree.
    -- VISUAL, QUICK START
    {
		"nvim-tree/nvim-tree.lua",
        version = "*",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugins.nvim-tree") end
    },

    -- Improves the standard vim status line (at the bottom) and adds a window header.
    -- VISUAL
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugins.lualine") end
    },

    -- Adds startup display.
    -- VISUAL, QUICK START
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function() require("plugins.alpha-nvim") end
    },

    -- Adds a window to edit files as code.
    -- VISUAL
    {
        "stevearc/oil.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugins.oil") end
    },

    -- Adds regex search and replacement.
    -- VISUAL
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        config = function() require("plugins.nvim-spectre") end
    },

    -- Adds quick file traversal keybindings.
    -- VISUAL
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        config = function() require("plugins.harpoon") end
    },

    -- Adds a window suggesting key commands.
    -- VISUAL
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        cmd = "WhichKey",
        config = function() require("plugins.which-key") end
    },

    -- Adds a view of functions, classes, and other relevant elements within the current buffer.
    -- VISUAL, CODE
    {
        "stevearc/aerial.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("plugins.aerial") end
    },

    -- Adds markdown files" preview functionality.
    -- VISUAL, CODE
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
