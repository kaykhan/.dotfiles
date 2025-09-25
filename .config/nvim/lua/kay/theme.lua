-- Theme
--vim.g.sonokai_style = "shusia"
--local ok, _ = pcall(vim.cmd, "colorscheme sonokai")
--if not ok then
--	print("colorscheme not found!")
--	return
--end

--vim.opt.background = "dark" -- set this to dark or light
--vim.cmd("colorscheme oxocarbon")
-- vim.cmd[[colorscheme tokyonight-night]]

vim.cmd([[colorscheme monokai-pro]])

-- Custom Highlights
vim.cmd("highlight TSFunction gui=bold")
vim.cmd("highlight @function.call gui=bold")
vim.cmd("hi Search guibg=#ffdd33 guifg=#000000")
vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
vim.cmd("hi CursorLineNr guifg=#ffdd33")

local signs = {
    Error = { icon = " ", priority = 1000 },
    Warn  = { icon = " ", priority = 900 },
    Info  = { icon = " ", priority = 800 },
    Hint  = { icon = " ", priority = 700 },
}

for type, opts in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = opts.icon,
        texthl = hl,
        numhl = "",
        priority = opts.priority,
    })
end

vim.diagnostic.config({
    severity_sort = true, -- ensures highest-severity sign wins on each line
    signs = true,
})


-- illuminate
vim.cmd("hi IlluminatedWordRead guibg=#525252")
vim.cmd("hi IlluminatedWordWrite guibg=NONE")

vim.cmd("hi FolderName guifg=#bababa")


--vim.cmd("highlight! link LspSagaHoverBorder Gray")
--vim.cmd("highlight! link DiagnosticSignHint Gray")
--
--
--vim.cmd("highlight! link LspHintHighlight Gray")
