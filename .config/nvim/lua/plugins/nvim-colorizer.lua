return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            "*",                                                   -- Highlight all filetypes
            css = { rgb_fn = true, hsl_fn = true },                -- Enable color functions for CSS files
            html = { names = true, rgb_fn = true, hsl_fn = true }, -- Enable color functions for HTML files
            json = { enable = true },                              -- Enable for JSON files
        })
    end,
}
