local is_float_window = function(winid)
    return vim.api.nvim_win_get_config(winid).relative ~= ""
end
return {
    {
        "Isrothy/neominimap.nvim",
        version = "v3.*.*",
        enabled = true,
        lazy = false, -- NOTE: NO NEED to Lazy load
        -- Optional
        keys = {
            -- Global Minimap Controls
            { "<leader>nm",  "<cmd>Neominimap toggle<cr>",      desc = "Toggle global minimap" },
            { "<leader>no",  "<cmd>Neominimap on<cr>",          desc = "Enable global minimap" },
            { "<leader>nc",  "<cmd>Neominimap off<cr>",         desc = "Disable global minimap" },
            { "<leader>nr",  "<cmd>Neominimap refresh<cr>",     desc = "Refresh global minimap" },

            -- Window-Specific Minimap Controls
            { "<leader>nwt", "<cmd>Neominimap winToggle<cr>",   desc = "Toggle minimap for current window" },
            { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>",  desc = "Refresh minimap for current window" },
            { "<leader>nwo", "<cmd>Neominimap winOn<cr>",       desc = "Enable minimap for current window" },
            { "<leader>nwc", "<cmd>Neominimap winOff<cr>",      desc = "Disable minimap for current window" },

            -- Tab-Specific Minimap Controls
            { "<leader>ntt", "<cmd>Neominimap tabToggle<cr>",   desc = "Toggle minimap for current tab" },
            { "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>",  desc = "Refresh minimap for current tab" },
            { "<leader>nto", "<cmd>Neominimap tabOn<cr>",       desc = "Enable minimap for current tab" },
            { "<leader>ntc", "<cmd>Neominimap tabOff<cr>",      desc = "Disable minimap for current tab" },

            -- Buffer-Specific Minimap Controls
            { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>",   desc = "Toggle minimap for current buffer" },
            { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>",  desc = "Refresh minimap for current buffer" },
            { "<leader>nbo", "<cmd>Neominimap bufOn<cr>",       desc = "Enable minimap for current buffer" },
            { "<leader>nbc", "<cmd>Neominimap bufOff<cr>",      desc = "Disable minimap for current buffer" },

            ---Focus Controls
            { "<leader>nf",  "<cmd>Neominimap focus<cr>",       desc = "Focus on minimap" },
            { "<leader>nu",  "<cmd>Neominimap unfocus<cr>",     desc = "Unfocus minimap" },
            { "<leader>ns",  "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
        },
        init = function()
            -- The following options are recommended when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36 -- Set a large value

            --- Put your configuration here
            ---@type Neominimap.UserConfig
            vim.g.neominimap = {
                auto_enable = true,
                -- How many columns a dot should span
                x_multiplier = 4, ---@type integer

                -- How many rows a dot should span
                y_multiplier = 2, ---@type integer

                sync_cursor = true,

                click = {
                    enabled = true, ---@type boolean
                    -- Automatically switch focus to minimap when clicked
                    auto_switch_focus = true, ---@type boolean
                },
                layout = "float",
                split = {

                    close_if_last_window = true,
                    minimap_height = 17,
                },
                float = {
                    minimap_width = 17,
                    window_border = { "", "", "", "", "", "", "", "" },
                },
                diagnostic = {
                    enabled = true,
                },
                search = {
                    enabled = true,
                },
                tab_filter = function(tab_id)
                    local win_list = vim.api.nvim_tabpage_list_wins(tab_id)
                    local exclude_ft = { "qf", "trouble", "neo-tree", "alpha", "neominimap", "snacks_dashboard" }
                    for _, win_id in ipairs(win_list) do
                        if not is_float_window(win_id) then
                            local bufnr = vim.api.nvim_win_get_buf(win_id)
                            if not vim.tbl_contains(exclude_ft, vim.bo[bufnr].filetype) then
                                return true
                            end
                        end
                    end
                    return false
                end,
            }
        end,
    },
}
