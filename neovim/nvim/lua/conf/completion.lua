local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_success, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local luasnip_success, luasnip = pcall(require, "luasnip")
local cmp_success, cmp = pcall(require, "cmp")
local lspkind_success, lspkind = pcall(require, "lspkind")

if (not (cmp_lsp_success and cmp_success and
		luasnip_success and lspkind_success and cmp ~= nil)) then
	return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

cmp.setup({
	mapping = {
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-e>"] = cmp.mapping.close(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	sources = {
		{ name = "gh_issues" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "text",
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
			}
		})
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	}
})
