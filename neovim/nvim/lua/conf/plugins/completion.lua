vim.cmd([[COQnow --shut-up]])

vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		manual_complete = "null",
	},
	display = {
		ghost_text = {context = {"<", ">"}},
		pum = {source_context = {"<", ">"}}
	},
}
