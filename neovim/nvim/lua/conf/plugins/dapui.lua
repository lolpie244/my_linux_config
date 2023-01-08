local success, dapui = pcall(require, "dapui")

if (not success) then
	return
end

dapui.setup({
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
})

local virtual_text
success, virtual_text = pcall(require, "nvim-dap-virtual-text")

if (not success) then
	return
end

virtual_text.setup({})
