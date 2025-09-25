return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                ignore_install = { "ipkg" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
