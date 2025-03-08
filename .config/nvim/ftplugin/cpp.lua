local keymap = vim.keymap.set
local opts = { remap = true, silent = true }
vim.g.cmake_state = "Debug"

function BuildCommand()
	local state = vim.g.cmake_state
	local build_command = string.format(
		"cmake -S . -B build/%s -D CMAKE_BUILD_TYPE=%s -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cmake --build build/%s --config %s",
		state,
		state,
		state,
		state
	)
	local copy_command = string.format("ln -nsfr build/%s/compile_commands.json build/compile_commands.json", state)

	return string.format("%s && %s", build_command, copy_command)
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

function Build()
	require("kitty-runner").launch(BuildCommand())
end

function Run()
	local file_path =
		vim.fn.input("Path to executable: ", string.format("%s/build/%s/", vim.fn.getcwd(), vim.g.cmake_state), "file")
	require("kitty-runner").send_to_runner(string.format("%s && clear && %s", BuildCommand(), file_path))
end

function ToUml()
	local full_path = vim.fn.expand("%")

	local command = string.format(
		"hpp2plantuml -i %s > ~/Documents/labs/4.2/diplom_text/uml/%s.puml",
		full_path,
		vim.fn.fnamemodify(full_path, ":t:r")
	)
	require("kitty-runner").launch(command)
end

keymap("n", "<Leader>rb", ":wa<CR><cmd>lua Build()<CR>", opts)
keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
keymap("n", "<Leader>rs", ":wa<CR><cmd>lua SwitchState()<CR>", opts)
keymap("n", "<Leader>ru", ":wa<CR><cmd>lua ToUml()<CR>", opts)

local set = vim.opt_local
set.tabstop = 4
set.shiftwidth = 4
