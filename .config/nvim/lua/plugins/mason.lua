return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "lua_ls",
                    "pyright",
                    "jsonls",
                    "prismals",
                    "terraformls",
                    "solc",
                    "vimls",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "yamlls",
                    "gopls",
                    "ruff",
                },
                -- automatic_installation = true, -- Uncomment if you want automatic installation
            })
        end,
    },
}
