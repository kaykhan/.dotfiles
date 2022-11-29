lua << EOF

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local pylint = {
  lintCommand = 'pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}',
  lintStdin = false,
  lintFormats = {"%f:%l:%c:%t:%m"},
}

local black = {
  formatCommand = 'black --line-length 100 -',
  formatStdin = true
}

local isort = {
  formatCommand = "isort --profile black -",
  formatStdin = true,
}

local autopep8 = {
  formatCommand = "autopep8 -",
  formatStdin = true
}

require'lspconfig'.efm.setup{
  on_attach = function(client)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities = capabilities
    client.resolved_capabilities.goto_definition = false
    client.resolved_capabilities.declaration = false  
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = { prettier, eslint },
      typescript = { prettier, eslint },
      typescriptreact = {prettier, eslint},
      javascriptreact = {prettier, eslint},
      ["javascript.jsx"] = {prettier, eslint},
      ["typescript.tsx"] = {prettier, eslint},
      yaml = {prettier},
      yml = {prettier},
      json = {prettier},
      html = {prettier},
      less = {prettier},
      scss = {prettier},
      css = {prettier},
      markdown = {prettier},
      python = {black, isort}  
    }
  },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "javascript.jsx",  
    "typescript.tsx",
    "typescriptreact",
    "less",
    "scss",
    "css",
    "html",
    "python",
    "json",
    "yaml",
    "yml",
  },
}

EOF
