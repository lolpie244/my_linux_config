local success, comment = pcall(require, "Comment")

if (not success) then
	return
end

comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
			line = 'gc',
			block = 'gbc',
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},
	mappings = {
		basic = true,
		extra = true,
	},
})
