local formatters = {
	"black",
	"sql-formatter",
	"rustfmt"
}


-- INSTALL LSP
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")



null_ls.setup({
	sources = {
		null_ls.builtins.formatting.astyle.with({
			extra_args = {
				"--style=kr",
				"--indent=tab",
			}
		}),
		null_ls.builtins.formatting.black.with({
			extra_args = {
				"-l 120",
			}
		})
	}
})

mason_null_ls.setup({
    ensure_installed = formatters,
	automatic_setup = true,
	handlers = {}
})