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

	-- "DAP" debuger
	"nvim-tree/nvim-web-devicons",
	"mfussenegger/nvim-dap",
	"nvim-neotest/nvim-nio",
	{ "rcarriga/nvim-dap-ui",            requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"theHamsta/nvim-dap-virtual-text",

	-- LSP and formatter
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"stevearc/conform.nvim",
	"zapling/mason-conform.nvim",
	"nvimdev/lspsaga.nvim",


	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Telescope dependencies
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"sharkdp/fd",
	"BurntSushi/ripgrep",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-lua/plenary.nvim",

	-- Telescope
	{ "nvim-telescope/telescope.nvim",            requires = { { "nvim-lua/plenary.nvim" } } },

	-- Git
	"sindrets/diffview.nvim",
	"kdheepak/lazygit.nvim",
	"lewis6991/gitsigns.nvim",

	-- database
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = {
			{ 'tpope/vim-dadbod',                     lazy = true },
			{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
		},
		cmd = {
			'DBUI',
			'DBUIToggle',
			'DBUIAddConnection',
			'DBUIFindBuffer',
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	-- mini
	"echasnovski/mini.ai",  -- better "actions INSIDE/ALL"
	"echasnovski/mini.jump", -- better jump TO/FORWARD
	"junegunn/vim-easy-align", -- align

	-- markdown
	{ "HakonHarnes/img-clip.nvim",     ft = { "markdown" } },
	{ "dhruvasagar/vim-table-mode",    ft = { "markdown" } },
	-- diagrams
	"aklt/plantuml-syntax",
	{ "https://gitlab.com/itaranto/preview.nvim", ft = { "puml" }, version = "*" },


	-- snacks
	{ "folke/snacks.nvim",
		opts = {
			image = {
				doc = {
					inline = false,
					float = false,
				}
			}
		}
	},

	-- kitty integration
	{ "mrjones2014/smart-splits.nvim", build = "./kitty/install-kittens.bash" }, -- better buffer resizing, integration with kitty

	-- languages
	{ "kiyoon/jupynium.nvim",          build = "pip install --break-system-packages --user ." }, -- jupiter

	-- etc
	"numToStr/Comment.nvim",                 -- Comment
	"Pocco81/auto-save.nvim",                -- Autosave
	"windwp/nvim-autopairs",                 -- brackets autopairs
	"nvim-lualine/lualine.nvim",             -- information line
	"MagicDuck/grug-far.nvim",               -- better replace
	"stevearc/oil.nvim",                     -- file browser
	"mbbill/undotree",                       -- undotree
	"theprimeagen/harpoon",                  -- marks for file
	"LunarVim/bigfile.nvim",                 -- bigfiles
	{ "kevinhwang91/nvim-bqf", ft = { "qf" } }, -- better quick fix
	"machakann/vim-sandwich",                -- surround

	-- own plugins
	-- { dir = "/mnt/1/projects/lua/kitty_runner.nvim/" },
	"lolpie244/simple-kitty-runner.nvim",

	-- Colorshemes
	{ "catppuccin/nvim",       name = "catppuccin" }
})
