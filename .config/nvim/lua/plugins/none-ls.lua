return {
    {
        "nvimtools/none-ls.nvim", -- configure formatters & linters
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local vim = vim
            local eslint_d = require("none-ls.diagnostics.eslint_d")
            -- Helper function to check for the presence of any ESLint config file
            local function has_eslint_config()
                -- Get the current working directory
                local cwd = vim.fn.getcwd()
                -- List of possible ESLint config filenames
                local eslint_patterns = {
                    ".eslintrc",
                    ".eslintrc.js",
                    ".eslintrc.json",
                    ".eslintrc.yaml",
                    ".eslintrc.yml",
                    "eslint.config.js",
                    "eslint.config.mjs",
                }

                -- Check each pattern
                for _, pattern in ipairs(eslint_patterns) do
                    local files = vim.fn.globpath(cwd, pattern, false, true)
                    if #files > 0 then
                        return true
                    end
                end

                return false
            end

            -- Define the sources
            local sources = {
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.stylua,
            }

            -- Conditionally add eslint_d and prettierd if any ESLint config file exists
            if has_eslint_config() then
                table.insert(
                    sources,
                    eslint_d.with({
                        diagnostics_format = "#{m} #{s}(#{c})",
                    })
                )
                --table.insert(sources, eslint_d.formatting.eslint_d)
                table.insert(sources, null_ls.builtins.formatting.prettierd)
            end

            -- Setup null-ls with the sources
            null_ls.setup({
                debug = false,
                sources = sources,
            })
        end,
    },
}
