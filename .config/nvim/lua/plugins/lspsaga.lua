return {
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                    enable_in_insert = false,
                    sign = false,
                    sign_priority = 40,
                    virtual_text = true,
                },
                symbol_in_winbar = {
                    separator = " › ",
                },
                diagnostic = {
                    on_insert = false,
                },
                move_in_saga = { prev = "<C-k>", next = "<C-j>" },
                finder_action_keys = {
                    open = "<CR>",
                },
                definition_action_keys = {
                    edit = "<CR>",
                },
            })
        end,
    },
}
