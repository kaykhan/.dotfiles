local neo_tree_status, neo_tree = pcall(require, "neo-tree")
if not neo_tree_status then
	return
end

neo_tree.setup({
	source_selector = {
		winbar = true,
		statusline = false,
	},
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	renderers = {
		directory = {
			{ "indent" },
			{ "icon" },
			{ "current_filter" },
			{ "diagnostics", errors_only = true, hide_when_expanded = true },
			{ "git_status", hide_when_expanded = true },
			{ "name" },
			{ "clipboard" },
		},
		file = {
			{ "indent" },
			{ "icon" },
			{ "diagnostics" },
			{ "git_status" },
			{ "name" },
			{ "clipboard" },
			{ "modified" },
		},
	},
})

vim.api.nvim_set_keymap("n", "<C-n>", ":NeoTreeFocusToggle<CR>", {})
