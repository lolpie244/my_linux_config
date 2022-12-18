local success, telescope = pcall(require, "telescope")

if (not success) then
	return
end


telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"venv"
		},
	},
	pickers = {
		find_files = {
			hidden = true
		}
	}
})

telescope.setup({
  extensions = {
    file_browser = {
	  respect_gitignore = false,
      theme = "ivy",
		path = "%:p:h",
		cwd_to_path = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
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
