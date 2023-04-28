local keymap = vim.keymap.set
local opts = { remap = true, silent = true }
vim.g.cmake_state = "Debug";


function GetCppProject(working_folder)
	local cmake_file = working_folder .. "/CMakeLists.txt"
	local opened_file = assert(io.open(cmake_file, "rb"))
	local project_name = opened_file:read("*all"):match(".*project%(([^%(%)]*)%).*")
	opened_file:close()
	return project_name;
end

function Build(silent)
	local state = vim.g.cmake_state
	local command = string.format("cmake -S . -B build/%s -D CMAKE_BUILD_TYPE=%s -DCMAKE_EXPORT_COMPILE_COMMANDS=1; cd build/%s; make; cd -", state, state, state)
  	if silent then
  		vim.api.nvim_command(":silent !" .. command)
	else
		vim.api.nvim_command("! " .. command)
	end
	command = string.format("ln -nsfr build/%s/compile_commands.json build/compile_commands.json", state)
	os.execute(command)
end

function SwitchState()
	local state = vim.fn.input("0: Release, 1: Debug, or custom: ")
	vim.api.nvim_command("redraw")
	if state == "0" then
		vim.g.cmake_state = "Release"
	elseif state == "1" then
		vim.g.cmake_state = "Debug"
	else
		vim.g.cmake_state = state
	end
	print("Current CMake type: " .. vim.g.cmake_state)
end

function Run()
	Build(true)
	local command = string.format("clear && clear; time ./build/%s/%s; echo", vim.g.cmake_state, GetCppProject(vim.fn.getcwd()))
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end


keymap("n", "<Leader>bb", ":wa<CR><cmd>lua Build(false)<CR>", opts)
keymap("n", "<Leader>r", ":wa<CR><cmd>lua Run()<CR>", opts)
keymap("n", "<Leader>bs", ":wa<CR><cmd>lua SwitchState()<CR>", opts)
