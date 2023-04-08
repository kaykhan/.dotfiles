require("scrollbar").setup({
	handle = {
		text = "  ",
	},
	marks = {
		Cursor = { text = "━━" },
		Search = { text = { "--", "==" } },
		Error = { text = { "--", "==" } },
		Warn = { text = { "--", "==" } },
		Info = { text = { "--", "==" } },
		Hint = { text = { "--", "==" } },
		Misc = { text = { "--", "==" } },
	},
	handlers = {
		cursor = true,
		diagnostic = true,
		gitsigns = true, -- Requires gitsigns
		handle = true,
		search = false, -- Requires hlslens
	},
})
