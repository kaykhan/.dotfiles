-- Theme
vim.g.sonokai_style = "shusia"
local ok, _ = pcall(vim.cmd, "colorscheme sonokai")
if not ok then
    print("colorscheme not found!")
    return
end

-- Custom Highlights
vim.cmd('highlight TSFunction gui=bold')
vim.cmd('highlight @function.call gui=bold')
vim.cmd('hi Search guibg=#ffdd33 guifg=#000000')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi CursorLineNr guifg=#ffdd33')

