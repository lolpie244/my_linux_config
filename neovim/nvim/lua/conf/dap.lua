local dap, dapui = require('dap') require('dapui')
local dap_adapters = string.format("%s/.config/nvim/lua/conf/dap_adapters", os.getenv( "HOME" ))
local foldername = vim.fn.getcwd():match("[^/]*$")


-- C#
dap.adapters.coreclr = {
  type = 'executable',
  command = string.format('%s/netcoredbg/netcoredbg', dap_adapters),
  args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function ()
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
    command = dap_adapters .. '/extension/adapter/codelldb',
    args = {"--port", "13000",}
  }
}
dap.configurations.cpp = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            return string.format("%s/build/%s/%s", vim.fn.getcwd(), vim.g.cmake_state, GetCppProject(vim.fn.getcwd()))
        end,
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        terminal = 'integrated'
    }
}
dap.configurations.h = dap.configurations.cpp
