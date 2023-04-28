local lsp_servers = {
	"clangd",
	"pyright",
	"cmake",
	"jsonls",
	"sqlls",
	"yamlls",
	"dockerls",
	"bashls",
	"texlab",
	"jdtls",
	"html",
	"cssls",
	"rust_analyzer",
	"omnisharp"
}

-- INSTALL LSP
local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup()
lspconfig.setup {
	ensure_installed = lsp_servers
}
--
-- SETUP LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.diagnostic.config({ virtual_text = false })
end
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)


for _, server in ipairs(lsp_servers) do
	lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
end

