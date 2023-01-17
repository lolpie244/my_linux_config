local function setup(name, data)
	data = data or {}
	local success, instance = pcall(require, name)

	if (success) then
		instance.setup(data)
	else
		error("ERROR WHILE LOADING " .. name)
	end
end


-- Gitsigns
setup("gitsigns", {
	signs = {
		add    = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
		change = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
		delete = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
	}
})

setup("diffview", {
	view = {
		merge_tool = {
			layout = "diff3_mixed"
		}
	},
})
