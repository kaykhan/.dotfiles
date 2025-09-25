return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
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
            error = { bg = "#181819" },
            warn = { bg = "#181819" },
            info = { bg = "#181819" },
          },
          symbols = { error = " ", warn = " ", info = " " },
          colored = true,
          update_in_insert = false,
          always_visible = true,
        },
        { "diff", color = { bg = "#181819" } },
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
  },
}
