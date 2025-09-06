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

    -- Adds Neovim's default lsp configurations.
    -- CODE
    {
        "neovim/nvim-lspconfig",
    },

    -- Adds startup time measurements and quick view.
    -- NEOVIM DEVELOPMENT
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },

    -- Adds a parser generator tool and an incremental parsing library.
    -- CODE
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSInstallInfo", "TSInstall" },
        config = function() require("plugins.nvim-treesitter") end
    },

    -- Adds Neovim development support.
    -- NEOVIM DEVELOPMENT, CODE
    {
        "folke/neodev.nvim",
        lspconfig = true,
        dependencies = {
            -- Adds Neovim's default lsp configurations.
            -- CODE
            "neovim/nvim-lspconfig",
        },
        config = function() require("plugins.neodev") end
    },

    -- Allows integration of LSP servers, linters, and formatters.
    -- CODE
    {
        "williamboman/mason.nvim",
        dependencies = {
            -- Adds Neovim's default lsp configurations.
            -- CODE
            "neovim/nvim-lspconfig",

            -- Bridge between mason.nvim and lspconfig.
            -- CODE
            "williamboman/mason-lspconfig.nvim",
        },
        build = function() pcall(vim.cmd, "MasonUpdate") end,
        config = function() require("plugins.mason") end
    },

    -- Adds a completion engine.
    -- CODE
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Adds Neovim's default lsp configurations.
            -- CODE
            "neovim/nvim-lspconfig",

            -- Bridge between nvim-cmp and lspconfig.
            -- CODE
            "hrsh7th/cmp-nvim-lsp",

            -- Adds snipet functionality.
            -- CODE
            "L3MON4D3/LuaSnip",
        },
        config = function() require("plugins.nvim-cmp") end
    },

    -- Adds functions to setup Neovim's LSP.
    -- CODE
    {
        "VonHeikemen/lsp-zero.nvim",
        cmd = "Mason",
        branch = "v3.x",
        dependencies = {
            -- Adds Neovim's default lsp configurations.
            -- CODE
            "neovim/nvim-lspconfig",

            -- Bridge between nvim-cmp and lspconfig.
            -- CODE
            "hrsh7th/cmp-nvim-lsp",

            -- Adds a completion engine.
            -- CODE
            "hrsh7th/nvim-cmp",

            -- Adds snipet functionality.
            -- CODE
            "L3MON4D3/LuaSnip",

            -- Adds a status line showing the current code context.
            -- VISUAL
            "SmiteshP/nvim-navic",
        },
        config = function() require("plugins.lsp-zero") end
    },

    -- Adds luasnip completion source for nvim-cmp.
    -- CODE
    {
        "saadparwaiz1/cmp_luasnip"
    },

    -- Adds a snippet collection.
    -- CODE
    {
        "rafamadriz/friendly-snippets"
    },

    -- Adds startup display.
    -- VISUAL, QUICK START
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function() require("plugins.alpha-nvim") end
    },

    -- Adds indentation visual indicators.
    -- VISUAL, CODE
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "User FilePost",
        dependencies = {
            -- Adds a parser generator tool and an incremental parsing library.
            -- CODE
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()  require("plugins.indent-blankline") end
    },

    -- Adds a directory search tree.
    -- VISUAL, QUICK START
    {
		"nvim-tree/nvim-tree.lua",
        version = "*",
        event = "VimEnter",
        dependencies = {
            -- Adds web icons support.
            -- VISUAL
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugins.nvim-tree") end
    },

    -- Improves the standard vim status line (at the bottom)
    --  and adds a window header.
    -- VISUAL
    {
        "famiu/feline.nvim",
        event = "VimEnter",
        opts = {},
        config = function() require("plugins.feline") end
    },

    -- Adds an advanced search window.
    -- CODE
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
            -- Adds functionality used by some plugins.
            -- CODE
            "nvim-lua/plenary.nvim",

            -- Adds undo history lookup.
            -- CODE, VISUAL
            "debugloop/telescope-undo.nvim",
        },
        config = function () require("plugins.telescope") end
    },

    -- Adds special task comments" highlighting and search.
    -- CODE
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            -- Adds functionality used by some plugins.
            -- CODE
            "nvim-lua/plenary.nvim",

            -- Adds an advanced search window.
            -- CODE
            "nvim-telescope/telescope.nvim",
        },
        config = function() require("plugins.todo-comments") end
    },

    -- Adds a vim command to execute git actions from within Neovim.
    -- CODE
    {
        "tpope/vim-fugitive",
        event = "VimEnter",
    },

    -- Adds markdown files" preview functionality.
    -- VISUAL, CODE
    {
        "iamcco/markdown-preview.nvim",
        event = "VimEnter",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end
    },

    -- Adds a window to edit files as code.
    -- CODE, VISUAL
    {
        "stevearc/oil.nvim",
        event = "VimEnter",
        dependencies = {
            -- Adds web icons support.
            -- VISUAL
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("plugins.oil") end
    },

    -- Adds visual indicators for who contributed with which line of code.
    -- VISUAL, CODE
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        config = function() require("plugins.gitsigns") end
    },

    -- Adds a signature display.
    -- CODE
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function() require("plugins.lsp_signature") end
    },

    -- Adds quick file traversal keybindings.
    -- CODE
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        config = function() require("plugins.harpoon") end
    },

    -- Adds fast comment key maps.
    -- CODE
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        dependencies = {
            -- Adds a parser generator tool and an incremental parsing library.
            -- CODE
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

    -- Improves search functions and search motions.
    -- CODE
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        dependencies = {
            -- Adds a parser generator tool and an incremental parsing library.
            -- CODE
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            -- TODO: Move keybindings to a configuration file.
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- Adds regex search and replacement.
    -- CODE, VISUAL
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        config = function() require("plugins.nvim-spectre") end
    },

    -- Adds a formatting command.
    -- CODE
    {
        'mhartington/formatter.nvim',
        event = "VeryLazy",
        config = function() require("plugins.formatter") end
    },

    -- Adds a window suggesting key commands.
    -- VISUAL
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function() require("plugins.which-key") end
    },

    -- Adds a case sensitive replacement command.
    -- CODE
    {
        "tpope/vim-abolish",
        event = "VeryLazy",
    },

    -- Adds a view of functions, classes, and other relevant elements within the current buffer.
    -- VISUAL, CODE
    {
        'stevearc/aerial.nvim',
        event = "VeryLazy",
        dependencies = {
            -- Adds a parser generator tool and an incremental parsing library.
            -- CODE
            "nvim-treesitter/nvim-treesitter",

            -- Adds web icons support.
            -- VISUAL
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("plugins.aerial") end
    },
}
