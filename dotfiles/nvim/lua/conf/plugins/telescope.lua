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
    file_browser = {
		respect_gitignore = false,
		theme = "ivy",
		path = "%:p:h",
		cwd_to_path = true,
		hijack_netrw = true,
		quite=true,
		git_status=false,
		hidden=true,
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
    },
	fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
})
require("telescope").load_extension("file_browser")
require('telescope').load_extension("fzf")
