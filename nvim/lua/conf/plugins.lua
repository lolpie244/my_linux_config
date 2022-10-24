local use = require("packer").use

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use "nvim-telescope/telescope-file-browser.nvim"
	use "tiagofumo/vim-nerdtree-syntax-highlight"
	use "nvim-tree/nvim-web-devicons"
	use "Xuyuanp/nerdtree-git-plugin"

  use "navarasu/onedark.nvim"
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	use "michaeljsmith/vim-indent-object"

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

	use "ellisonleao/gruvbox.nvim"
end)
