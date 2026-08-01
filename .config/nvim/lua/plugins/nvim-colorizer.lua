return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        filetypes = {
            "*", -- Highlight all filetypes
            css = {
                parsers = { css = true },
            },
            html = {
                parsers = {
                    names = { enable = true },
                    rgb = { enable = true },
                    hsl = { enable = true },
                },
            },
            json = {},
        },
    },
}
