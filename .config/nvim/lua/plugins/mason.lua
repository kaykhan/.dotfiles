return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
				require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"pyright",
					"jsonls",
					"prismals",
					"terraformls",
					"solc",
					"vimls",
					"html",
					"cssls",
					"tailwindcss",
					"yamlls",
				},
				automatic_enable = {
					exclude = {
						"lua_ls",
						"ts_ls",
						"pyright",
						"gopls",
						"ruff",
						"yamlls",
						"terraformls",
						"biome",
						"tailwindcss",
						"prismals",
						"eslint",
					},
				},
				-- Prevent automatic setup to avoid conflicts with manual setup in lsp.lua
				automatic_installation = false,
				handlers = {
					-- Default handler that does nothing (prevents auto-setup)
					function(server_name)
						-- Do nothing - let lsp.lua handle the setup
					end,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
				require("mason-null-ls").setup({
				ensure_installed = {
					"prettier", -- ts/js formatter
					"stylua", -- lua formatter
					"eslint_d",
					"prettierd",
					"eslint-lsp",
				},
				-- automatic_installation = true, -- Uncomment if you want automatic installation
			})
		end,
	},
}
