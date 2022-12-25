--         ╭──────────────────────────────────────────────────────────╮
--         │                           Plugins                        │
--         ╰──────────────────────────────────────────────────────────╯

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local is_dev = true
if vim.loop.os_uname().sysname == "Windows_NT" then
    is_dev = false
end

require("lazy").setup({
    -- Colorscheme
    { "ThemerCorp/themer.lua", dev = is_dev, config = require("plugins.configs.themer") },
    {
        "nvim-treesitter/nvim-treesitter",
        config = require("plugins.configs.treesitter"),
        build = ":TSUpdate",
        dependencies = {
            { "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" } },
        },
    },
    { "RRethy/vim-illuminate", config = require("plugins.configs.illuminate"), event = "BufWinEnter" },
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
        config = function()
            require("neodim").setup()
        end,
    },

    -- UI
    {
        "akinsho/bufferline.nvim",
        branch = "dev",
        config = require("plugins.configs.bufferline"),
        dependencies = {
            "famiu/bufdelete.nvim",
        },
    },
    { "rebelot/heirline.nvim", config = require("plugins.configs.heirline") },
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({})
        end,
        cmd = "NvimTreeToggle",
    },
    { "glepnir/dashboard-nvim", config = require("plugins.configs.dashboard") },
    "kyazdani42/nvim-web-devicons",
    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = require("plugins.configs.noice"),
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
                dependencies = {
                    "williamboman/mason-lspconfig.nvim",
                    config = require("plugins.configs.mason"),
                },
            },
        },
    },
    { "jose-elias-alvarez/null-ls.nvim", config = require("plugins.configs.null-ls") },
    {
        "SmiteshP/nvim-navic",
        config = function()
            require("nvim-navic").setup({})
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").init_lsp_saga({})
        end,
    },
    {
        "folke/trouble.nvim",
        config = require("plugins.configs.lsp-trouble"),
        event = "BufWinEnter",
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
            "nvim-telescope/telescope-frecency.nvim",
            {
                "AckslD/nvim-neoclip.lua",
                config = require("plugins.configs.neoclip"),
            },
            "tami5/sqlite.lua",
        },
        cmd = "Telescope",
        lazy = true,
        config = require("plugins.configs.telescope"),
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        config = require("plugins.configs.cmp"),
        event = "BufWinEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets",
            { "L3MON4D3/LuaSnip", config = require("plugins.configs.luasnip") },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            { "tzachar/cmp-tabnine", build = "./install.sh" },
        },
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- Language Agnostic Tools
    { "michaelb/sniprun", build = "bash ./install.sh", lazy = true, cmd = { "SnipRun", "SnipInfo" } }, -- Not exactly working I am not sure why...
    {
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup()
        end,
        dependencies = { "stevearc/dressing.nvim" },
        event = "VeryLazy",
    },

    -- Lua Dev
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({})
        end,
        ft = "lua",
    },

    -- Rust Dev
    {
        "saecki/crates.nvim",
        event = "BufRead Cargo.toml",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.configs.crates"),
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup({})
        end,
        ft = "rs",
    },

    -- Web Dev
    { "windwp/nvim-ts-autotag", ft = { "html", "svelte" } },

    -- Lang Dev
    {
        "p00f/godbolt.nvim",
        build = "rm -rf fnl/",
        cmd = { "Godbolt", "GodboltCompiler" },
        config = require("plugins.configs.godbolt"),
    },

    -- Notes
    { "nvim-neorg/neorg", config = require("plugins.configs.neorg"), ft = "norg" },

    -- General
    { "windwp/nvim-autopairs", event = "InsertEnter", config = require("plugins.configs.autopairs") },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        keys = "gc",
    },
    { "fedepujol/move.nvim", event = "BufWinEnter" },
    "LudoPinelli/comment-box.nvim",
    { "akinsho/toggleterm.nvim", config = require("plugins.configs.toggleterm"), keys = "<F12>" },
    { "max397574/which-key.nvim", config = require("plugins.configs.which-key"), event = "VeryLazy" },
    {
        "folke/todo-comments.nvim",
        event = "BufWinEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        lazy = true,
        config = require("plugins.configs.persistence"),
    },
    {
        "rktjmp/paperplanes.nvim",
        cmd = "PP",
        config = function()
            require("paperplanes").setup({})
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup()
        end,
        event = "BufWinEnter",
    },
}, {
    dev = {
        -- directory where you store your local plugin projects
        path = "~/repos",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
})
