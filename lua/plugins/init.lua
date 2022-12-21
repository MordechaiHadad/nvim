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

require("lazy").setup({
	-- Colorscheme
	{ dir = "/home/morde/repos/themer.lua", config = require("plugins.configs.themer") },
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
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim", config = require("plugins.configs.null-ls") },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup()
				end,
			},
			{
				"SmiteshP/nvim-navic",
				config = function()
					require("nvim-navic").setup({})
				end,
			},
		},
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").init_lsp_saga({})
		end,
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

	-- Web Dev
	{ "windwp/nvim-ts-autotag", ft = { "html", "svelte" } },

	-- Notes
	{ "nvim-neorg/neorg", config = require("plugins.configs.neorg"), ft = "norg" },

	-- General
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("plugins.configs.autopairs") },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "BufWinEnter",
	},
	{ "fedepujol/move.nvim", event = "BufWinEnter" },
	"LudoPinelli/comment-box.nvim",
	{ "akinsho/toggleterm.nvim", config = require("plugins.configs.toggleterm"), keys = "<F12>" },
    { "max397574/which-key.nvim", config = require("plugins.configs.which-key"), keys = "<Space>" },
})
