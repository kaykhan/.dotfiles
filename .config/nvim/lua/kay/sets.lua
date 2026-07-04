vim.opt.number = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.clipboard = "osc52"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.o.autoread = true
--vim.opt.list = true

--vim.opt.listchars = {
--	space = "·",
--	--eol = "↴",
--	--tab = ".",
--	trail = "·",
--	nbsp = "␣",
--}

vim.cmd([[highlight ExtraWhitespace guifg=#525252]])
vim.cmd([[highlight link Whitespace ExtraWhitespace]])

-- Apply the highlight group to the list characters
vim.cmd([[highlight link NonText ExtraWhitespace]])
vim.cmd([[highlight link SpecialKey ExtraWhitespace]])
vim.cmd([[highlight link EndOfBuffer ExtraWhitespace]])

vim.g.snacks_animate = false
