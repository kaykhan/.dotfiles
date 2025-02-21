-- gcc ((un)comment line), gbc ((un)comment block)
require("Comment").setup({
	pre_hook = function()
		return vim.bo.commentstring
	end,
})
