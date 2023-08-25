-- Gitsigns
require("gitsigns").setup({
	signs = {
		add    = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
		change = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
		delete = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
	}
})

require("diffview").setup({
	view = {
		merge_tool = {
			layout = "diff3_mixed"
		}
	},
})

