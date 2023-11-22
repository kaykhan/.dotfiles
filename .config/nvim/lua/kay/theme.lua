-- Theme
vim.g.sonokai_style = "shusia"
local ok, _ = pcall(vim.cmd, "colorscheme sonokai")
if not ok then
	print("colorscheme not found!")
	return
end

--vim.opt.background = "dark" -- set this to dark or light
--vim.cmd("colorscheme oxocarbon")
-- vim.cmd[[colorscheme tokyonight-night]]


-- Custom Highlights
vim.cmd("highlight TSFunction gui=bold")
vim.cmd("highlight @function.call gui=bold")
vim.cmd("hi Search guibg=#ffdd33 guifg=#000000")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
vim.cmd("hi CursorLineNr guifg=#ffdd33")

local signs = { Error = " ", Warn = " ", Hint = " ", Information = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.cmd("highlight! link LspSagaHoverBorder Gray")
vim.cmd("highlight! link DiagnosticSignHint Gray")
--vim.cmd("highlight! link DiagnosticHint Gray")
--vim.cmd("highlight! link DiagnosticUnderlineHint Gray")
--vim.cmd("highlight! link LspHintHighlight Gray")
--vim.cmd("highlight! link LspDiagnosticsFloatingHint Gray")
--vim.cmd("highlight! link DiagnosticFloatingHint Gray")
--vim.cmd("highlight! link LspDiagnosticsUnderlineHint Gray")

-- nvim-scrollbar
vim.cmd("highlight! link DiagnosticVirtualTextError Red")
vim.cmd("highlight! link DiagnosticVirtualTextWarn Yellow")
vim.cmd("highlight! link DiagnosticVirtualTextInfo Blue")
--vim.cmd("highlight! link DiagnosticVirtualTextHint Gray")

-- illuminate
vim.cmd("hi IlluminatedWordRead guibg=#525252")
vim.cmd("hi IlluminatedWordWrite guibg=NONE")

vim.cmd("hi FolderName guifg=#bababa")

-- Link nvimtree colors to neotree until sonokai implements neotree colors
vim.cmd([[
highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
highlight! link NeoTreeDirectoryName NvimTreeFolderName
highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
highlight! link NeoTreeRootName NvimTreeRootFolder
highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
highlight! link NeoTreeDirectoryName FolderName
highlight! link NeoTreeGitModified Yellow
]])

