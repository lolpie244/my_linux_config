local true_zen_success, true_zen = pcall(require, "true-zen")

if(not true_zen_success) then
	return
end

true_zen.setup({
	modes = {
		narrow = {
			folds_style = "invisible"
		}
	}
})
