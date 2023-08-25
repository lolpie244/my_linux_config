local etc_disable = {
	name = "etc_disable", -- name
  	-- opts = {
   --  	defer = false, -- set to true if `disable` should be called on `BufReadPost` and not `BufReadPre`
  	-- },
  	disable = function() -- called to disable the feature
		require("auto-save").off()
		require("cmp").setup.buffer {
			sources = {}
		}
		vim.api.nvim_command("set nospell")
  	end,
}

-- default config
require("bigfile").setup {
  filesize = 100, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  features = { -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
	etc_disable,
  },
}
