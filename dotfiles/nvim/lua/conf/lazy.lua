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
{"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}},
"theHamsta/nvim-dap-virtual-text",

-- LSP and formatter
"neovim/nvim-lspconfig",
"williamboman/mason.nvim",
"williamboman/mason-lspconfig.nvim",
"jose-elias-alvarez/null-ls.nvim",
"jay-babu/mason-null-ls.nvim",

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
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
"sharkdp/fd",
"BurntSushi/ripgrep",
{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
"nvim-lua/plenary.nvim",

-- Telescope
{"nvim-telescope/telescope.nvim", requires = { {"nvim-lua/plenary.nvim"} }},

-- Git
"sindrets/diffview.nvim",
"kdheepak/lazygit.nvim",
"lewis6991/gitsigns.nvim",

-- database
"kristijanhusak/vim-dadbod-ui",
"tpope/vim-dadbod",
"kristijanhusak/vim-dadbod-completion",

-- mini
"echasnovski/mini.ai", -- better "actions INSIDE/ALL"
"echasnovski/mini.jump", -- better jump TO/FORWARD
"echasnovski/mini.surround", -- change surrounding

-- etc
"numToStr/Comment.nvim", -- Comment
"dhruvasagar/vim-zoom", -- Focus on buffer
"Pocco81/auto-save.nvim", -- Autosave
"akinsho/toggleterm.nvim", -- better inside vim terminal
"windwp/nvim-autopairs", -- brackets autopairs
"nvim-lualine/lualine.nvim", -- information line
"lukas-reineke/indent-blankline.nvim", -- lines that represent tab's start
{ "mrjones2014/smart-splits.nvim", build = "./kitty/install-kittens.bash" }, -- better buffer resizing, integration with kitty
"windwp/nvim-spectre", -- better replace
"stevearc/oil.nvim", -- file browser
"mbbill/undotree", -- undotree
"theprimeagen/harpoon", -- marks for file

-- Colorshemes
{ "catppuccin/nvim", name = "catppuccin" }
})

