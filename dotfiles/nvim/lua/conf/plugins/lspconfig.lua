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
	"omnisharp",
	"lua_ls",
	"marksman"
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

	-- OMNISHAR FIX
	if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment", "excluded_code", "identifier", "keyword", "keyword_control", "number", "operator", "operator_overloaded", "preprocessor_keyword", "string", "whitespace", "text", "static_symbol", "preprocessor_text", "punctuation", "string_verbatim", "string_escape_character", "class_name", "delegate_name", "enum_name", "interface_name", "module_name", "struct_name", "type_parameter_name", "field_name", "enum_member_name", "constant_name", "local_name", "parameter_name", "method_name", "extension_method_name", "property_name", "event_name", "namespace_name", "label_name", "xml_doc_comment_attribute_name", "xml_doc_comment_attribute_quotes", "xml_doc_comment_attribute_value", "xml_doc_comment_cdata_section", "xml_doc_comment_comment", "xml_doc_comment_delimiter", "xml_doc_comment_entity_reference", "xml_doc_comment_name", "xml_doc_comment_processing_instruction", "xml_doc_comment_text", "xml_literal_attribute_name", "xml_literal_attribute_quotes", "xml_literal_attribute_value", "xml_literal_cdata_section", "xml_literal_comment", "xml_literal_delimiter", "xml_literal_embedded_expression", "xml_literal_entity_reference", "xml_literal_name", "xml_literal_processing_instruction", "xml_literal_text", "regex_comment", "regex_character_class", "regex_anchor", "regex_quantifier", "regex_grouping", "regex_alternation", "regex_text", "regex_self_escaped_character", "regex_other_escape",
        },
      },
      range = true,
    }
  end
end
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)


for _, server in ipairs(lsp_servers) do
	lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
end


require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

require('lspsaga').setup({
	outline = {
		-- auto_preview = false,
		close_after_jump = true,
		layout = "float",
		keys = {
			toggle_or_jump = "<Leader>",
			jump = "<Enter>"
		}
	},
	lightbulb = {
		enable = false
	},
	symbol_in_winbar = {
		show_file = false
	},
})
