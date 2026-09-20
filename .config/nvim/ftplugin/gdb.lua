local set = vim.opt_local

set.spell = false

-- 1. THE FORMATTER
local function gdb_qf_format(info)
	local items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	local l = {}

	for idx = info.start_idx, info.end_idx do
		local e = items[idx]
		local ud = e.user_data or {}

		-- CASE A: SEPARATOR
		if ud.is_separator then
			-- Format: "------------------ Thread 1 ------------------"
			local sep_text = string.format("------------------ Thread %s ------------------", ud.thread_id)
			table.insert(l, sep_text)

		-- CASE B: STACK FRAME
		else
			local fid = ud.frame_id or "?"

			-- Create Prefix: Just the frame number (aligned to 4 chars)
			-- Format: "  #0"
			local prefix = string.format("  #%-2s", fid)

			-- Clean Text: Remove "#1 0x... in"
			local clean_text = e.text:gsub("^#%d+%s+0x%x+%s+in%s+", "")

			-- Fallback cleanup
			if clean_text == e.text then
				clean_text = e.text:gsub("^#%d+%s+", "")
			end

			local str = string.format("%-6s | %s", prefix, vim.trim(clean_text))
			table.insert(l, str)
		end
	end
	return l
end

-- 2. THE PARSER
local function parse_and_open_gdb()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local qf_items = {}
	local current_thread_id = "?"
	local bufnr = vim.api.nvim_get_current_buf()

	for i, line in ipairs(lines) do
		-- A. Detect Thread Header
		local t_match = line:match("^Thread%s+(%d+)")
		if t_match then
			current_thread_id = t_match
			-- Add Separator Item
			table.insert(qf_items, {
				bufnr = bufnr,
				lnum = i,
				text = line,
				user_data = { is_separator = true, thread_id = current_thread_id },
			})
		end

		-- B. Detect Stack Frame
		local f_match = line:match("^#(%d+)")
		if f_match then
			table.insert(qf_items, {
				bufnr = bufnr,
				lnum = i,
				text = line,
				user_data = {
					is_separator = false,
					thread_id = current_thread_id,
					frame_id = f_match,
				},
			})
		end
	end

	if #qf_items > 0 then
		vim.fn.setqflist(qf_items, "r")
		vim.fn.setqflist({}, "r", { quickfixtextfunc = gdb_qf_format })
		vim.cmd.copen()
		vim.cmd.wincmd("p")
	else
		print("No GDB frames found.")
	end
end

vim.schedule(parse_and_open_gdb)
