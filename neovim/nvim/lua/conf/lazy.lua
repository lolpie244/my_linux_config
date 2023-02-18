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
-- DAP debuger
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
{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
"sharkdp/fd",
"BurntSushi/ripgrep",
{"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
"nvim-lua/plenary.nvim",

-- Telescope
{"nvim-telescope/telescope.nvim", requires = { {"nvim-lua/plenary.nvim"} }},
"nvim-telescope/telescope-file-browser.nvim",

-- Git
"sindrets/diffview.nvim",
"kdheepak/lazygit.nvim",
"lewis6991/gitsigns.nvim",

-- database
"kristijanhusak/vim-dadbod-ui",
"tpope/vim-dadbod",

-- mini
"echasnovski/mini.ai", -- better "actions INSIDE/ALL"
"echasnovski/mini.jump", -- better jump TO/FORWARD

-- etc
"numToStr/Comment.nvim", -- Comment
"Pocco81/true-zen.nvim", -- Focus on buffer
"Pocco81/auto-save.nvim", -- Autosave
"akinsho/toggleterm.nvim", -- better inside vim terminal
"windwp/nvim-autopairs", -- brackets autopairs
"nvim-lualine/lualine.nvim", -- information line
"lukas-reineke/indent-blankline.nvim", -- lines that represent tab's start
"mrjones2014/smart-splits.nvim", -- better buffer resizing, integration with tmux
"declancm/cinnamon.nvim", -- better scroll
"windwp/nvim-spectre", -- better replace


-- Colorshemes
{"catppuccin/nvim", lazy = false},

})

