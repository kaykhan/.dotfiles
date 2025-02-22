return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = "cmdline_popup", -- popup-style cmdline
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim", title = "" },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- send long messages to a split
      inc_rename = false, -- disable inc-rename.nvim dialog
      lsp_doc_border = false, -- no border for LSP hover/signature help
    },
    views = {
      mini = {
        win_options = {
          winblend = 100,
        },
      },
    },
  },
}
