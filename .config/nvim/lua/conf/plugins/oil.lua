local select = function(params)
	local oil = require("oil")
	oil.select(params)
	vim.cmd.wincmd({ args = { "p" } })
	oil.close()
	vim.cmd.wincmd({ args = { "p" } })
end

local vertical_split = function()
	select({ vertical = true })
end

local split = function()
	select({ horizontal = true })
end


require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["<C-v>"] = vertical_split,
		["<C-x>"] = split,
		["<Leader>v"] = "actions.select_vsplit",
		["<Leader>x"] = "actions.select_split",
		["<C-p>"] = "actions.preview",
		["<Esc>"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["g."] = "actions.toggle_hidden",
	},
	delete_to_trash = true
})
