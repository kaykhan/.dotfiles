local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- configure null_ls
null_ls.setup({
	debug = true,
	-- setup formatters & linters
	sources = {
		diagnostics.eslint_d,
		formatting.stylua,
		formatting.eslint_d,
		formatting.prettier,
	},
})
