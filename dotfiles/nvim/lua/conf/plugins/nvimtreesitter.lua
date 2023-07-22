local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = {
		"c",
		"cpp",
		"cmake",
		"lua",
		"python",
		"javascript",
		"java",
		"sql",
		"c_sharp",
		"dockerfile",
		"bash",
		"latex",
		"html",
		"css",
		-- "markdown",
		-- "markdown_inline"
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "markdown" },
	},
	indent = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<C-s>',
			node_incremental = '<C-s>',
			node_decremental = '<c-backspace>',
		}
	},
})
