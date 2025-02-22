return {
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					separator_style = "thin",
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
					offsets = {
						{ filetype = "neo-tree", text = "", highlight = "Directory", padding = 1 },
					},
					tab_size = 10,
					-- diagnostics = "nvim_lsp",
					-- Uncomment and customize the diagnostics_indicator if needed:
					-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
					--   local s = " "
					--   for e, n in pairs(diagnostics_dict) do
					--     local sym = e == "error" and " " or (e == "warning" and " " or "")
					--     s = s .. n .. sym
					--   end
					--   return s
					-- end,
				},
				highlights = {
					fill = {
						bg = "#121212",
					},
					background = {
						bg = "#181819",
					},
					tab = {
						fg = "#ffdd33",
						bg = "#ffdd33",
					},
					tab_selected = {
						fg = "#ffdd33",
						bg = "#ffdd33",
					},
					buffer_selected = {
						fg = "#181819",
						bg = "#ffdd33",
						bold = true,
						italic = false,
					},
					close_button = {
						fg = "#181819",
						bg = "#ffdd33",
					},
					close_button_visible = {
						fg = "#181819",
						bg = "#ffdd33",
					},
					close_button_selected = {
						fg = "#181819",
						bg = "#ffdd33",
					},
					separator_selected = {
						fg = "#181819",
					},
					separator_visible = {
						fg = "#181819",
					},
					separator = {
						fg = "#181819",
					},
					indicator_selected = {
						fg = "#181819",
						bg = "#ffdd33",
					},
					modified = {
						fg = "#ffdd33",
						bg = "#181819",
					},
					modified_visible = {
						fg = "#ffdd33",
						bg = "#181819",
					},
					modified_selected = {
						bg = "#ffdd33",
						fg = "#181819",
					},
				},
			})
		end,
		keys = {
			{ "<TAB>", ":BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<S-TAB>", ":BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		},
	},
}
