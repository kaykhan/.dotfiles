local custom_codedark = require("lualine.themes.codedark")
-- Change the background of lualine_c section for normal mode
custom_codedark.normal.a.bg = "#ffdd33"
custom_codedark.normal.b.fg = "#ffdd33"

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "monokai-pro",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "neo-tree" },
            winbar = { "neo-tree" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch", color = { bg = "#181819" } },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info" },
                diagnostics_color = {
                    error = { bg = "#181819" }, -- match with the lualine background
                    warn = { bg = "#181819" }, -- match with the lualine background
                    info = { bg = "#181819" }, --
                },
                symbols = { error = " ", warn = " ", info = " " },
                colored = true,
                update_in_insert = false,
                always_visible = true, -- Always show diagnostics, even when there are none
            },
            { "diff",   color = { bg = "#181819" } },
        },
        lualine_c = { { "filename", path = 3 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {},
})
