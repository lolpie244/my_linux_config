local empty_setup = {
	"mini.jump",
	"mini.ai",
}

for _, plugin in ipairs(empty_setup) do
	require(plugin).setup()
end

require("mini.surround").setup({
	mappings = {
		add = "Sa",
		delete = "Sd",
		find = "Sf",
		find_left = "",
		highlight = "",
		replace = "Sc",
		update_n_lines = ""
	}
})

