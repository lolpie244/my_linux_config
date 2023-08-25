local telescope = require("telescope")

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules/",
			"venv",
			".venv",
			"build/",
			"__pycache__/",
			".git/",
		},
		mappings = {
			["i"] = {
				["<M-t>"] = actions.file_tab,
				["<M-v>"] = actions.file_vsplit,
				["<M-x>"] = actions.file_split
			},
			["n"] = {
				["<M-t>"] = actions.file_tab,
				["<M-v>"] = actions.file_vsplit,
				["<M-x>"] = actions.file_split
			},
		},
		layout_strategy = 'vertical',
		layout_config = {
			height = 0.95,
			preview_height = 0.68
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		}
	},

})

telescope.setup({
  extensions = {
	fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
})
require('telescope').load_extension("fzf")
