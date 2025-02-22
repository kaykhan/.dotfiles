return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp", -- Autocompletion capabilities
            "nvimdev/lspsaga.nvim", -- UI Enhancements
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Global Diagnostic Keymaps
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

            -- Capabilities for LSPs
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- On Attach Function
            local on_attach = function(client, bufnr)
                -- Enable omnifunc completion
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

                if client.name == "ts_ls" then
                    client.server_capabilities.document_formatting = false
                    client.server_capabilities.document_range_formatting = false
                end

                -- Buffer-local LSP Keymaps
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
                vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
                vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
                vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
                vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
                vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
                vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", bufopts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
            end

            -- Enable diagnostic updates in insert mode
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = true })

            -- List of LSP servers to install
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                        },
                    },
                },
                ts_ls = {},
                pyright = {},
                gopls = {},
                yamlls = {},
                terraformls = {},
                biome = {},
                tailwindcss = {},
                prismals = {},
                eslint = {
                    on_attach = function(client, bufnr)
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            command = "EslintFixAll",
                        })
                    end,
                },
            }

            -- Apply setup for each LSP server
            for server, config in pairs(servers) do
                config.capabilities = capabilities
                config.on_attach = on_attach
                lspconfig[server].setup(config)
            end

            -- Set Terraform file types
            vim.api.nvim_exec(
                [[
          augroup TerraformFiletype
            autocmd!
            autocmd BufRead,BufNewFile *.tf,*.hcl,*.tfbackend,*.tfvars set filetype=terraform
          augroup END
        ]],
                false
            )
        end,
    },
}
