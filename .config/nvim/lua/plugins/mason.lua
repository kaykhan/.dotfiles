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
                },
                -- automatic_installation = true, -- Uncomment if you want automatic installation
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "prettier", -- ts/js formatter
                    "stylua",   -- lua formatter
                    "eslint",
                    "eslint_d",
                    "prettierd",
                    "eslint-lsp"
                },
                -- automatic_installation = true, -- Uncomment if you want automatic installation
            })
        end,
    },
}
