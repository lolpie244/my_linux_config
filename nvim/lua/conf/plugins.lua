local use = require("packer").use

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use "preservim/nerdtree"
	use "tiagofumo/vim-nerdtree-syntax-highlight"
	use "ryanoasis/vim-devicons"
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
		"terrortylor/nvim-comment",
		config = function ()
			require("nvim_comment").setup({
				create_mappings = true,
				line_mapping = "gc",
				operator_mapping = "<Leader>c",
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
