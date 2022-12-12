
" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" colorscheme nvcode " Or whatever colorscheme you make

let g:sonokai_style = 'shusia'
""let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1


colorscheme sonokai

lua << EOF
--vim.opt.background = "dark" -- set this to dark or light
--vim.cmd("colorscheme oxocarbon")
EOF

"custom theme 
highlight TSFunction gui=bold
highlight @function.call gui=bold
"



hi Search guibg=#ffdd33 guifg=#000000

:highlight Search guibg=Turquoise4
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
    hi CursorLineNr guifg=#ffdd33
endif



"let g:airline_theme = "minimalist" 

""""""""""AIRLINE
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"gitgutter
let g:gitgutter_sign_added = "▌"
let g:gitgutter_sign_modified = "▌"
let g:gitgutter_sign_removed = "▁"
let g:gitgutter_sign_removed_first_line = "▔"
let g:gitgutter_sign_removed_above_and_below = "▁"
let g:gitgutter_sign_modified_removed = "▁"



"https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#ffdd33
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#ffdd33
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
