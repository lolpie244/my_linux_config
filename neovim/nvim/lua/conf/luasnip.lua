local success, luasnip = pcall(require, "luasnip")

if(not success) then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
