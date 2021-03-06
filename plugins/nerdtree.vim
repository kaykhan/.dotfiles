""""""""""NERDTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"open nerd tree using shortcut
"nnoremap <C-n> :NERDTree<CR>
map <C-n> :call NERDTreeToggleAndRefresh()<CR>


function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

let NERDTreeShowHidden=1

"Nerdtreegitstatus
let g:NERDTreeGitStatusUseNerdFonts = 1
"let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeMouseMode=2

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ' '


