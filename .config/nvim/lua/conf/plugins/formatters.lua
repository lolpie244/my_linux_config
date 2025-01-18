require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    cpp = { "clang-format" },
	sql = { "sql_formatter" },
	json = { "jq" },
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },
})

require("conform").formatters.black = {
  prepend_args = { "-l", "120" },
}

require("mason-conform").setup()
