vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })

-- remap JK move selected lines about
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- x greatest remap preserve paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- map insert mode i to ctrl c to esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace current word your on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
