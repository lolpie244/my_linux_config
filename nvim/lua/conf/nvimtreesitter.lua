require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"cmake",
		"lua",
		"python",
		"javascript",
		"sql",
		"c_sharp",
		"dockerfile",
		"bash",
		"latex",
		"html",
		"css",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
