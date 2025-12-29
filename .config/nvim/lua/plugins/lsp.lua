return {
    -- Completion (unchanged)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "nvimdev/lspsaga.nvim",
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            -- Global diagnostic keymaps (builtin; keep these)
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
            -- (Use either builtin or saga for jumps, not both to avoid conflicts)
            vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

            -- Capabilities (let 0.11 advertise encodings; don't force utf-16)
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Shared on_attach
            local on_attach = function(client, bufnr)
                vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
                local b = { noremap = true, silent = true, buffer = bufnr }

                -- Saga-enhanced UI
                vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", b)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, b)
                vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", b)
                vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", b)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, b)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, b)
                vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", b)
                vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", b)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, b)
                vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", b)

                -- Format
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, b)
            end

            -- Servers (0.11-native). You can still rely on nvim-lspconfig presets.
            local servers = {
                -- Biome: only if project has Biome config to avoid clashes
                biome = {
                    cmd = { "biome", "lsp-proxy" },
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
                    single_file_support = true,
                },

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

                ts_ls = {
                    on_attach = function(client, bufnr)
                        -- Turn off TypeScript’s formatter so it won’t compete with Biome
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,

                },
                pyright = {},
                gopls = {},

                -- Ruff: prefer the built-in server
                ruff = { cmd = { "ruff", "server" } },

                yamlls = {},
                terraformls = {},
                tailwindcss = {},
                prismals = {},
                eslint = {},
                html = {},
                jsonls = {}, -- valid lspconfig name
                cssls = {},
                vimls = {},
            }

            -- Register & enable
            local to_enable = {}
            for name, cfg in pairs(servers) do
                cfg.capabilities = capabilities
                local extra_on_attach = cfg.on_attach
                cfg.on_attach = function(client, bufnr)
                    if type(extra_on_attach) == "function" then extra_on_attach(client, bufnr) end
                    on_attach(client, bufnr)
                end
                vim.lsp.config(name, cfg)
                table.insert(to_enable, name)
            end
            vim.lsp.enable(to_enable)

            -- Diagnostics behavior (0.11 virtual_text is off by default)
            vim.diagnostic.config({
                virtual_text = { source = true },
                float = { source = true },
                severity_sort = true,
                update_in_insert = true,
            })

            -- Terraform filetypes (use modern autocmds)
            local aug = vim.api.nvim_create_augroup("TerraformFiletype", { clear = true })
            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                group = aug,
                pattern = { "*.tf", "*.hcl", "*.tfbackend", "*.tfvars" },
                callback = function() vim.bo.filetype = "terraform" end,
            })
        end,
    },
}
