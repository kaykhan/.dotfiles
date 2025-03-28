return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "LspAttach",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
				},
				panel = { enabled = true },
			})
		end,
	},
	{
		"yetone/avante.nvim",
		config = function()
			require("avante").setup({
				provider = "claude",
				hints = { enabled = false },
			})
		end,
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "", "Avante" },
				},
				ft = { "", "Avante" },
			},
		},
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup({
				display = {
					chat = {
						window = {
							position = "right",
						},
					},
				},
				adapters = {
					openai = function()
						return require("codecompanion.adapters").extend("openai", {
							env = {
								api_key = "",
							},
						})
					end,
				},
				strategies = {
					chat = {
						adapter = "openai",
					},
					inline = {
						adapter = "openai",
					},
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				virtualtext = {
					auto_trigger_ft = {},
					keymap = {
						-- accept whole completion
						accept = "<A-A>",
						-- accept one line
						accept_line = "<A-a>",
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = "<A-z>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-[>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-]>",
						dismiss = "<A-e>",
					},
				},

				provider = "openai",
				provider_options = {
					openai = {
						model = "o3-mini-2025-01-31",
						stream = true,
						api_key = "OPENAI_API_KEY",
					},
				},
			})
		end,
	},
}
