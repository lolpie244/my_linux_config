require("nvim-treesitter").setup({
	sync_install = true,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

local ensure_installed = {
	"c",
	"cpp",
	"cmake",
    "make",
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
	"markdown",
	"markdown_inline",
}

local alreadyInstalled = require("nvim-treesitter.config").get_installed()
local parsersToInstall = vim.iter(ensure_installed)
	:filter(function(parser)
		return not vim.tbl_contains(alreadyInstalled, parser)
	end)
	:totable()
require("nvim-treesitter").install(parsersToInstall)

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.keymap.set({ "n", "x", "o" }, "<C-s>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent (outer) node" })
