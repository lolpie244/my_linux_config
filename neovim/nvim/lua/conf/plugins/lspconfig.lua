local keymap = vim.keymap.set

require("nvim-lsp-installer").setup({
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local coq = require("coq")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gdd", vim.lsp.buf.definition, bufopts)
	keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "<Leader>S", vim.lsp.buf.signature_help, bufopts)
	keymap("n", "<Leader>T", vim.lsp.buf.type_definition, bufopts)
	keymap("n", "<Leader>R", vim.lsp.buf.rename, bufopts)
	keymap("n", "gr", vim.lsp.buf.references, bufopts)
	vim.diagnostic.config({ virtual_text = false })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = coq.lsp_ensure_capabilities(capabilities)


lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})


lspconfig.omnisharp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.sqls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
