lua << EOF
require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
}
EOF
