return {
    {
        "folke/sidekick.nvim",
        opts = {
            -- add any options here
            cli = {
                mux = {
                    backend = "tmux",
                    enabled = true,
                },
            },
        },
        keys = {
            {
                "<tab>",
                function()
                    -- if there is a next edit, jump to it, otherwise apply it if any
                    if not require("sidekick").nes_jump_or_apply() then
                        return "<Tab>" -- fallback to normal tab
                    end
                end,
                expr = true,
                desc = "Goto/Apply Next Edit Suggestion",
            },
            {
                "<c-.>",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "i", "x" },
            },
            {
                "<leader>aa",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle CLI",
            },
            {
                "<leader>as",
                function()
                    require("sidekick.cli").select()
                end,
                -- Or to select only installed tools:
                -- require("sidekick.cli").select({ filter = { installed = true } })
                desc = "Select CLI",
            },
            {
                "<leader>ad",
                function()
                    require("sidekick.cli").close()
                end,
                desc = "Detach a CLI Session",
            },
            {
                "<leader>at",
                function()
                    require("sidekick.cli").send({ msg = "{this}" })
                end,
                mode = { "x", "n" },
                desc = "Send This",
            },
            {
                "<leader>af",
                function()
                    require("sidekick.cli").send({ msg = "{file}" })
                end,
                desc = "Send File",
            },
            {
                "<leader>av",
                function()
                    require("sidekick.cli").send({ msg = "{selection}" })
                end,
                mode = { "x" },
                desc = "Send Visual Selection",
            },
            {
                "<leader>ap",
                function()
                    require("sidekick.cli").prompt()
                end,
                mode = { "n", "x" },
                desc = "Sidekick Select Prompt",
            },
            -- Example of a keybinding to open Claude directly
            {
                "<leader>ac",
                function()
                    require("sidekick.cli").toggle({ name = "claude", focus = true })
                end,
                desc = "Sidekick Toggle Claude",
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "LspAttach",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            -- Upstream still calls client.is_stopped(), which warns on Nvim 0.12+.
            local source = require("copilot_cmp.source")
            source.is_available = function(self)
                if self.client:is_stopped() or self.client.name ~= "copilot" then
                    return false
                end

                return next(vim.lsp.get_clients({
                    bufnr = vim.api.nvim_get_current_buf(),
                    id = self.client.id,
                })) ~= nil
            end

            require("copilot_cmp").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                },
                panel = { enabled = true },
            })
        end,
    },
    -- {
    --     "olimorris/codecompanion.nvim",
    --     config = function()
    --         require("codecompanion").setup({
    --             display = {
    --                 chat = {
    --                     window = {
    --                         position = "right",
    --                     },
    --                 },
    --             },
    --             adapters = {
    --                 openai = function()
    --                     return require("codecompanion.adapters").extend("openai", {
    --                         env = {
    --                             api_key = "",
    --                         },
    --                     })
    --                 end,
    --             },
    --             strategies = {
    --                 chat = {
    --                     adapter = "openai",
    --                 },
    --                 inline = {
    --                     adapter = "openai",
    --                 },
    --             },
    --         })
    --     end,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    -- },
    {
        "milanglacier/minuet-ai.nvim",
        config = function()
            require("minuet").setup({
                virtualtext = {
                    auto_trigger_ft = {},
                    keymap = {
                        -- accept whole completion
                        accept = "<A-A>",
                        -- accept one line
                        accept_line = "<A-a>",
                        -- accept n lines (prompts for number)
                        -- e.g. "A-z 2 CR" will accept 2 lines
                        accept_n_lines = "<A-z>",
                        -- Cycle to prev completion item, or manually invoke completion
                        prev = "<A-[>",
                        -- Cycle to next completion item, or manually invoke completion
                        next = "<A-]>",
                        dismiss = "<A-e>",
                    },
                },

                provider = "openai",
                provider_options = {
                    openai = {
                        model = "o3-mini-2025-01-31",
                        stream = true,
                        api_key = "OPENAI_API_KEY",
                    },
                },
            })
        end,
    },
}
