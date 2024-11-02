-- Gitsigns

require("gitsigns").setup({
	signs = {
		add    = { text = '+'},
		change = { text = '~'},
		delete = { text = '-'},
	}
})

require("diffview").setup({
	view = {
		merge_tool = {
			layout = "diff3_mixed"
		}
	},
})

