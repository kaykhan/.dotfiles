lua << END
local custom_codedark = require'lualine.themes.codedark'

-- Change the background of lualine_c section for normal mode
custom_codedark.normal.a.bg = '#ffdd33'
custom_codedark.normal.b.fg = '#ffdd33'

require('lualine').setup {
    options = {
        theme = custom_codedark
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    }
}
END
