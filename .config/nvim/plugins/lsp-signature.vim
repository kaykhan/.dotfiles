

lua <<EOF
 require "lsp_signature".setup{
     bind = true, -- This is mandatory, otherwise border config won't get registered.
     hint_enable = false,
     handler_opts = {
       border = "rounded"
     }
 }
EOF
