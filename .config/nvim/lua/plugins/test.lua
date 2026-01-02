vim.api.nvim_set_hl(0, "UndercurlProbe", { undercurl = true, sp = "Red" })
vim.api.nvim_buf_add_highlight(0, -1, "UndercurlProbe", vim.fn.line(".") - 1, 0, -1)
