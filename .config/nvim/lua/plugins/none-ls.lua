return {
    {
        "nvimtools/none-ls.nvim", -- configure formatters & linters
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local eslint_d = require("none-ls.diagnostics.eslint_d")

            local eslint_config_files = {
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.json",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                "eslint.config.js",
                "eslint.config.mjs",
                "eslint.config.cjs",
                "eslint.config.ts",
                "eslint.config.mts",
                "eslint.config.cts",
            }

            local function has_eslint_config(utils)
                return utils.root_has_file(eslint_config_files)
            end

            -- Define the sources
            local sources = {
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.stylua,
                eslint_d.with({
                    diagnostics_format = "#{m} #{s}(#{c})",
                    condition = has_eslint_config,
                }),
                null_ls.builtins.formatting.prettierd.with({
                    condition = has_eslint_config,
                }),
            }

            -- Setup null-ls with the sources
            null_ls.setup({
                debug = false,
                sources = sources,
            })
        end,
    },
}
