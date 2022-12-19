local use = require("packer").use

return require("packer").startup(function()

	use "wbthomason/packer.nvim"

	use "nvim-tree/nvim-web-devicons"
	use "mfussenegger/nvim-dap"

	use "navarasu/onedark.nvim"
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

	use "hrsh7th/nvim-cmp"
	use "Pocco81/true-zen.nvim"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "onsails/lspkind.nvim"

	use "Pocco81/auto-save.nvim"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"

	use "Vimjas/vim-python-pep8-indent"
	use "nvim-lua/plenary.nvim"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	use 'nvim-treesitter/nvim-treesitter-context'

	use "nvim-telescope/telescope-file-browser.nvim"
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		"numToStr/Comment.nvim",
		config = function ()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
						line = 'gc',
						block = 'gbc',
				},
				opleader = {
					line = 'gc',
					block = 'gb',
				},
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end
	}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}
	use {
		"theHamsta/nvim-dap-virtual-text",
		config = function ()
			require("nvim-dap-virtual-text").setup()
		end
	}

	use {
		"windwp/nvim-autopairs",
		config = function ()
			require("nvim-autopairs").setup({})
		end
	}

	use "nvim-lualine/lualine.nvim"
	use "lukas-reineke/indent-blankline.nvim"

	use "mhinz/vim-signify"
	use "tpope/vim-fugitive"

	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"},
		config = function ()
		require("dapui").setup({
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
				},
			})
		end
	}
	use "catppuccin/nvim"
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use "kdheepak/lazygit.nvim"
	use "mrjones2014/smart-splits.nvim"
end)
