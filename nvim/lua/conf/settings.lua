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

letg.mapleader = " "
letg.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
letg.netrw_banner = 0
letg.indent_blankline_char = "│";


vim.cmd [[
    colorscheme onedark
		highlight TabLine gui=None guibg=#282828 guifg=#bdae93
		highlight TabLineSel gui=None guibg=#bdae93 guifg=#282828
		highlight TabLineFill gui=None guibg=#282828 guifg=#bdae93

		highlight ExtraWhitespace guibg=#bdae93
		match ExtraWhitespace /\s\+$/
]]



