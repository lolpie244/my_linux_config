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
set.linebreak = true
set.virtualedit = "block"
set.shortmess = "A"

-- persistent undo
set.undofile = true
set.undolevels = 1000
set.undoreload = 10000
set.keymap = "ukrainian-jcuken"
set.iminsert = 0
set.imsearch = 0

set.shortmess = "F"

letg.mapleader = " "
letg.maplocalleader = ","

-- plugins
letg.indent_blankline_char = "│"
letg.sandwich_no_default_key_mappings = 1
letg.operator_sandwich_no_default_key_mappings = 1
letg.textobj_sandwich_no_default_key_mappings = 1

-- colorscheme
-- catppuccin-frappe
-- onedark
vim.cmd([[
	highlight ExtraWhitespace guibg=#bdae93
	match ExtraWhitespace /\s\+$/
]])

-- filetypes
vim.filetype.add({ extension = { pro = "prolog", vert = "glsl", frag = "glsl", puml = "puml" } })
