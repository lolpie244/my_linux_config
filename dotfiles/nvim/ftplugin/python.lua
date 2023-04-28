local keymap = vim.keymap.set
local opts = { remap = true, silent = true }


local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    return vim.fn.getreg('v')
end

local function left_trim(s)
   return (s:gsub("^%s*(.-)", "%1"))
end

local function format_text(text)
	local lines = {}
	for s in text:gmatch("[^\r\n]+") do
		table.insert(lines, s)
	end

	local whitespace_count = 0

	for _, line in ipairs(lines) do
		if line == nil then
			line = ""
		end
		whitespace_count = line:len() - left_trim(line):len()
		if left_trim(line):len() ~= 0 then
			break
		end
	end
	if whitespace_count == 0 then
		return text
	end
	text = ""
	for _, line in ipairs(lines) do
		text = text .. line:sub(whitespace_count + 1, line:len()) .. '\n'
	end
	return text
end

local function SaveSelectedInFile(before, after)
	before = before or ""
	after = after or ""
	local filename = string.format("%s/.run_selected", vim.fn.getcwd())
	local file = io.open(filename, 'w')

	file:write(before .. format_text(get_visual_selection()) .. after)
	file:close()

	return filename
end

function RunSelected()
	local filename = SaveSelectedInFile()
	local command = string.format("clear; python %s", filename)
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end

function Run()
	local command = string.format("clear; python %s", vim.fn.expand('%:p'))
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end

function DjangoRun()
	local before = [[
import django, os
try:
	exec(open('manage.py').read())
except:
	pass
os.system('clear')
django.setup()
]]
	local filename = SaveSelectedInFile(before)
	local command = string.format("clear; python %s check", filename)
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end

keymap("v", "<Leader>r", "<cmd>lua RunSelected()<CR>", opts)
keymap("v", "<Leader>dr", "<cmd>lua DjangoRun()<CR>", opts)
keymap("n", "<Leader>r", "<cmd>lua Run()<CR>", opts)
