return {
	"HiPhish/rainbow-delimiters.nvim",
	init = function()
		vim.g.rainbow_delimiters = {
			whitelist = {
				"bash",
				"c",
				"cpp",
				"css",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"query",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			condition = function(bufnr)
				return vim.bo[bufnr].buflisted and vim.bo[bufnr].buftype == ""
			end,
		}
	end,
}
