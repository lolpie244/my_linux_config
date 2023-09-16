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
function GetCppProject(working_folder)
	local cmake_file = working_folder .. "/CMakeLists.txt"
	local opened_file = assert(io.open(cmake_file, "rb"))
	local project_name = opened_file:read("*all"):match(".*project%(([^%(%)]*)%).*")
	opened_file:close()
	return project_name;
end

dap.adapters.codelldb = {
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
		name = "codelldb",
		type = 'codelldb',
		request = 'launch',
		program = function()
			return vim.fn.input("Path to executable: ", string.format("%s/build/%s/", vim.fn.getcwd(), vim.g.cmake_state), "file")
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
			return string.format("%s/build/%s/%s", vim.fn.getcwd(), vim.g.cmake_state, GetCppProject(vim.fn.getcwd()))
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
