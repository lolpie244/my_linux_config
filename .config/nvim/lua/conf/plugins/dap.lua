local dap, dapui = require('dap')
require('dapui')
local dap_adapters = string.format("%s/.local/share/nvim/mason/bin", os.getenv("HOME"))
local foldername = vim.fn.getcwd():match("[^/]*$")


-- C#
dap.adapters.coreclr = {
	type = 'executable',
	command = string.format('%s/netcoredbg/netcoredbg', dap_adapters),
	args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return string.format("%s/bin/Debug/net6.0/%s.dll", vim.fn.getcwd(), foldername)
		end
	},
}

-- C++
dap.adapters.lldb = {
	type = 'server',
	port = "13000",
	executable = {
		-- CHANGE THIS to your path!
		command = dap_adapters .. '/codelldb',
		args = { "--port", "13000", }
	}
}
dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = dap_adapters .. '/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
	{
		name = "lldb",
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd(), "file")
		end,
		--program = '${fileDirname}/${fileBasenameNoExtension}',
		cwd = '${workspaceFolder}',
		terminal = 'integrated'
	},
	{
		default = true,
		name = "cppdbg",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd(), "file")
		end,
		cwd = '${workspaceFolder}',
		stopAtEntry = true,

		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'enable pretty printing',
				ignoreFailures = false
			},
		},
	},
}
dap.configurations.h = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- dapui
require("dapui").setup({
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
})

require("nvim-dap-virtual-text").setup({})
