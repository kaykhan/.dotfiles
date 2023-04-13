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
		--diagnostics = "nvim_lsp",
		tab_size = 10,
		--diagnostics_indicator = function(count, level, diagnostics_dict, context)
		--	local s = " "
		--	for e, n in pairs(diagnostics_dict) do
		--		local sym = e == "error" and " " or (e == "warning" and " " or "")
		--		s = s .. n .. sym
		--	end
		--	return s
		--end,
	},
	highlights = {
		fill = {
			--fg = '#ffdd33',
			bg = "#121212",
		},
		background = {
			-- fg = '#ffdd33',
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
			--bg = '#ffdd33',
		},
		separator_visible = {
			fg = "#181819",
			--bg = '#ffdd33',
		},
		separator = {
			fg = "#181819",
			--bg = '#ffdd33',
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

--nnoremap <silent><TAB> :BufferLineCycleNext<CR>
--nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
