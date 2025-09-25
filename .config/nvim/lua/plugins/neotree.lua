return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
        "nvim-lua/plenary.nvim"
    },
    cmd = "Neotree",
    keys = {
        { "<C-n>", ":Neotree toggle<CR>", desc = "Toggle Neo-tree", silent = true },
    },
    opts = {
        source_selector = {
            winbar = true,
            statusline = false,
        },
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        default_component_configs = {
            indent = {
                with_expanders = true, -- Enable expanders when file nesting is enabled
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
}
