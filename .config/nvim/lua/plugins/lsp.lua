
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
      local util = require("lspconfig.util")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Global Diagnostic Keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      -- Capabilities for LSPs (unify position encodings to UTF-16 to match tsserver)
      local capabilities = cmp_nvim_lsp.default_capabilities()
      capabilities.general = capabilities.general or {}
      capabilities.general.positionEncodings = { "utf-16" }

      -- On Attach Function (shared)
      local on_attach = function(client, bufnr)
        -- Enable omnifunc completion
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

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

        -- Format mapping: force Biome (avoid eslint/ts_ls/null-ls)
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({
            async = true,
            filter = function(c) return c.name == "biome" end,
          })
        end, bufopts)
      end

      -- Helper to compose per-server on_attach with the shared one
      local function extend_on_attach(extra)
        return function(client, bufnr)
          if type(extra) == "function" then extra(client, bufnr) end
          on_attach(client, bufnr)
        end
      end

      -- Enable diagnostic updates in insert mode
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = true })

      -- Servers and their specific settings
      local servers = {
        -- Biome: monorepo-friendly root + explicit filetypes; use lsp-proxy
        biome = {
          cmd = { "biome", "lsp-proxy" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
          root_dir = util.root_pattern("biome.json", "biome.jsonc", "package.json", ".git"),
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

        -- tsserver: disable formatting so Biome owns it
        ts_ls = {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          init_options = { hostInfo = "neovim" },
        },

        pyright = {},
        gopls = {},
        ruff = {},
        yamlls = {},
        terraformls = {},
        tailwindcss = {},
        prismals = {},

        -- ESLint: keep for lint/code actions, not formatting
        eslint = {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          settings = {
            format = false,
            codeAction = {
              disableRuleComment = { enable = true, location = "separateLine" },
              showDocumentation = { enable = true },
            },
            experimental = { useFlatConfig = false },
            run = "onType",
            validate = "on",
            workingDirectory = { mode = "auto" },
          },
        },

        html = {},
        jsonls = {},
        cssls = {},
        prismals = {},
        vimls = {},
      }

      -- Apply setup for each LSP server (compose on_attach if server provides one)
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        if config.on_attach then
          config.on_attach = extend_on_attach(config.on_attach)
        else
          config.on_attach = on_attach
        end
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

