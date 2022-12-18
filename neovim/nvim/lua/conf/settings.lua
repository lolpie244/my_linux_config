local set = vim.opt
local letg = vim.g

-- Common
set.autoindent = true
set.smartindent = true
set.number = true
set.updatetime = 4000
set.termguicolors = true
set.splitright = true
set.tabstop = 4
set.shiftwidth = 4
set.relativenumber = true
set.scrolloff = 10
set.ignorecase = true
set.laststatus = 3
set.timeoutlen = 1000
set.ttimeoutlen = 0
set.mouse = "a"
set.wrap = false

-- persistent undo
set.undofile = true
set.undolevels = 1000
set.undoreload = 10000

letg.mapleader = " "
letg.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
letg.netrw_banner = 0
letg.indent_blankline_char = "│";
letg.vimspector_enable_mappings = "HUMAN"

-- colorscheme
-- catppuccin-frappe
-- onedark
vim.cmd [[
    colorscheme catppuccin-frappe

		highlight ExtraWhitespace guibg=#bdae93
		match ExtraWhitespace /\s\+$/
]]

