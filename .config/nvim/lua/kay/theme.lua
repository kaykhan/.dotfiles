-- Theme
vim.g.sonokai_style = "shusia"
local ok, _ = pcall(vim.cmd, "colorscheme sonokai")
if not ok then
	print("colorscheme not found!")
	return
end

-- Custom Highlights
vim.cmd("highlight TSFunction gui=bold")
vim.cmd("highlight @function.call gui=bold")
vim.cmd("hi Search guibg=#ffdd33 guifg=#000000")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
vim.cmd("hi CursorLineNr guifg=#ffdd33")

local signs = { Error = " ", Warning = " ", Hint = " ", Information = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
