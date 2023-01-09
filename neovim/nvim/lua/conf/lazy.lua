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

-- LSP
"neovim/nvim-lspconfig",
"williamboman/nvim-lsp-installer",

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

-- etc
"numToStr/Comment.nvim", -- Comment
"Pocco81/true-zen.nvim", -- Focus on buffer
"Pocco81/auto-save.nvim", -- Autosave
"Vimjas/vim-python-pep8-indent", -- in brackets lines for python
"akinsho/toggleterm.nvim", -- better inside vim terminal
"windwp/nvim-autopairs", -- brackets autopairs
"nvim-lualine/lualine.nvim", -- information line
"lukas-reineke/indent-blankline.nvim", -- lines that represent tab's start
"mrjones2014/smart-splits.nvim", -- better buffer resizing, integration with tmux
"winston0410/cmd-parser.nvim", -- dependencies for plugin belove
"winston0410/range-highlight.nvim", -- highlight lines that selected
"declancm/cinnamon.nvim", -- better scroll

-- Colorshemes
{"catppuccin/nvim", lazy = false},

})

