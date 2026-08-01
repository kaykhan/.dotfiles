return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"nvimdev/lspsaga.nvim",
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Diagnostics: update while typing (new API)
			vim.diagnostic.config({ update_in_insert = true })

			-- Global diagnostics keymaps
			local gopts = { noremap = true, silent = true }
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, gopts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, gopts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, gopts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, gopts)

			-- LSP attach (buffer-local maps, formatting tweaks, etc.)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					-- Enable omnifunc
					vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Disable formatting from ts_ls (use dedicated formatter instead)
					if client.name == "ts_ls" then
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end

					-- ESLint: fix on save
					if client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "LspEslintFixAll",
						})
					end

					local b = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", b)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, b)
					vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", b)
					vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", b)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, b)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, b)
					vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", b)
					vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", b)
					vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", b)
					vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", b)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, b)
					vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", b)
					vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", b)
					vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", b)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, b)
				end,
			})

			-- Capabilities (cmp)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Helper to register a server with common capabilities
			local function enable(server, cfg)
				cfg = cfg or {}
				cfg.capabilities = vim.tbl_deep_extend("force", cfg.capabilities or {}, capabilities)
				vim.lsp.config(server, cfg)
			end

			-- Servers (Neovim 0.11+ names)
			enable("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			enable("ts_ls") -- TypeScript/JavaScript
			enable("pyright")
			enable("gopls", {
				filetypes = { "go", "gomod", "gowork" },
			})
			enable("ruff", {}) -- Ruff (new API name is 'ruff')
			enable("yamlls", {
				filetypes = { "yaml" },
			})
			enable("terraformls")
			enable("biome")
			enable("tailwindcss", {
				filetypes = {
					"astro",
					"blade",
					"clojure",
					"css",
					"eelixir",
					"elixir",
					"eruby",
					"haml",
					"handlebars",
					"heex",
					"html",
					"htmlangular",
					"htmldjango",
					"javascript",
					"javascriptreact",
					"less",
					"liquid",
					"markdown",
					"mustache",
					"php",
					"razor",
					"sass",
					"scss",
					"svelte",
					"stylus",
					"templ",
					"twig",
					"typescript",
					"typescriptreact",
					"vue",
				},
			})
			enable("prismals")
			enable("eslint")
			enable("clangd", {
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			})

			-- Enable all of the above
			vim.lsp.enable({
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
				"clangd",
			})

			-- Terraform filetypes
			vim.api.nvim_create_augroup("TerraformFiletype", { clear = true })
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				group = "TerraformFiletype",
				pattern = { "*.tf", "*.hcl", "*.tfbackend", "*.tfvars" },
				callback = function()
					vim.bo.filetype = "terraform"
				end,
			})
		end,
	},
}
