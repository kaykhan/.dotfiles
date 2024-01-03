local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	"nyoom-engineering/oxocarbon.nvim",
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	"neovim/nvim-lspconfig",
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
		"glepnir/lspsaga.nvim",
		branch = "main",
	},
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	{
		"ray-x/lsp_signature.nvim",
	},
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{ "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},
	{
		"utilyre/sentiment.nvim",
		version = "*",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"HiPhish/rainbow-delimiters.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags
	{
		"lewis6991/gitsigns.nvim",
	},
	--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			--"rcarriga/nvim-notify",
		},
	},
	"tpope/vim-surround",
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	"goolord/alpha-nvim",
	"numToStr/Comment.nvim",
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
	},
	"j-hui/fidget.nvim",
	"petertriho/nvim-scrollbar",
	"RRethy/vim-illuminate",
	--"github/copilot.vim",
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				lazy = true,
				debug = true,
			})
		end,
	},
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1
		end,
	},

	"kristijanhusak/vim-dadbod-completion",
	"dstein64/vim-startuptime",
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
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
				inc_search = "background", -- underline | background
				background_clear = {
					"float_win",
					"toggleterm",
					"telescope",
					-- "which-key",
					"renamer",
					"notify",
					-- "nvim-tree",
					"neo-tree",
					-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
				}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
				plugins = {
					bufferline = {
						underline_selected = false,
						underline_visible = false,
					},
					indent_blankline = {
						context_highlight = "default", -- default | pro
						context_start_underline = false,
					},
				},
				---@param c Colorscheme
				override = function()
					return {
						Normal = { bg = "#121212" },
						DiagnosticVirtualTextError = { bg = "none" },
						DiagnosticVirtualTextInformation = { bg = "none" },
						DiagnosticVirtualTextWarning = { bg = "none" },
						DiagnosticVirtualTextHint = { fg = "Gray", bg = "none" },
                        HintText = { bg = "Gray"},
						DiagnosticSignHint = { fg = "Gray" },
						LspHintHighlight = { fg = "Gray" },
						CursorLine = { bg = "#222327" },
					}
				end,
			})
		end,
	},
}

require("lazy").setup(plugins, {})
