return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local parsers = {
				"bash",
				"c",
				"cpp",
				"css",
				"go",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"svelte",
				"typst",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			}

			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash",
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"javascript",
					"json",
					"latex",
					"lua",
					"markdown",
					"python",
					"query",
					"regex",
					"rust",
					"scss",
					"svelte",
					"typst",
					"typescript",
					"typescriptreact",
					"vim",
					"vimdoc",
					"vue",
					"yaml",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
