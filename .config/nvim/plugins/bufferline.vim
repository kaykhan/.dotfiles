lua << EOF
require('bufferline').setup {
        options = {
            separator_style = "thin",
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
        },
	    highlights = {
            fill = {
                --fg = '#ffdd33',
                bg = '#181819',
            },
            background = {
                -- fg = '#ffdd33',
                bg = '#181819',
            },
            tab = {
                fg = '#ffdd33',
                bg = '#ffdd33',
            },
            tab_selected = {
                fg = '#ffdd33',
                bg = '#ffdd33',
            },
            buffer_selected = {
                fg = '#181819',
                bg = '#ffdd33',
                bold = true,
                italic = false,
            },
		    close_button = {
                fg = '#181819',
                bg = '#ffdd33',
            },
            close_button_visible = {
                fg = '#181819',
                bg = '#ffdd33',
            },
            close_button_selected = {
                fg = '#181819',
                bg = '#ffdd33',
            },
        	separator_selected = {
	    	    fg = '#181819',
                --bg = '#ffdd33',
            },
            separator_visible = {
                fg = '#181819',
                --bg = '#ffdd33',
            },
            separator = {
                fg = '#181819',
                --bg = '#ffdd33',
            },
	        indicator_selected = {
                fg = '#181819',
                bg = '#ffdd33',
            },
            modified = {
                fg = '#ffdd33',
                bg = '#181819',
            },
            modified_visible = {
                fg = '#ffdd33',
                bg = '#181819',
            },
            modified_selected = {
                bg = '#ffdd33',
                fg = '#181819',
            },
        }
    }
EOF

nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
