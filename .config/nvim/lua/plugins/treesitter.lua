return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- recommended on main
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			-- Optional; defaults are fine, but this is the new entrypoint
			ts.setup({
				-- install_dir = vim.fn.stdpath("data") .. "/site", -- default shown in README
			})

			-- Replace "all" with a curated list (recommended).
			-- Start with what you actually edit:
			local langs = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"json",
				"yaml",
				"toml",
				"terraform",
				"hcl",
				"go",
				"gomod",
				"gosum",
				"markdown",
				"markdown_inline",
				"javascript",
				"jsdoc",
				"typescript",
				"tsx",
				"html",
				"css",
				"python",
			}

			-- Install missing parsers (no-op if already installed)
			ts.install(langs)

			-- Enable TS highlighting per-buffer when possible
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TSStart", { clear = true }),
				pattern = "*",
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
