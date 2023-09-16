local keymap = vim.keymap.set
local opts = { remap = true, silent = true }
vim.g.cmake_state = "Debug";


function Build(silent)
	local state = vim.g.cmake_state
	local command = string.format("cmake -S . -B build/%s -D CMAKE_BUILD_TYPE=%s -DCMAKE_EXPORT_COMPILE_COMMANDS=1; cd build/%s; make; cd -", state, state, state)
  	if silent then
  		vim.api.nvim_command(":silent !" .. command)
	else
		require("kitty-runner").launch(command)
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
	local file_path = vim.fn.input("Path to executable: ", string.format("%s/build/%s/", vim.fn.getcwd(), vim.g.cmake_state), "file")
	local command = string.format("time (%s; echo; echo)", file_path)
	require("kitty-runner").send_to_runner(command)
end


keymap("n", "<Leader>rb", ":wa<CR><cmd>lua Build(false)<CR>", opts)
keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
keymap("n", "<Leader>rs", ":wa<CR><cmd>lua SwitchState()<CR>", opts)

