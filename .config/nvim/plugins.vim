call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
"dev icons
Plug 'ryanoasis/vim-devicons'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Theme
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Git
Plug 'lewis6991/gitsigns.nvim'

"lspconfig
Plug 'neovim/nvim-lspconfig'

"autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'ray-x/lsp_signature.nvim'

"indentline
Plug 'lukas-reineke/indent-blankline.nvim'
"diagnostic list
Plug 'folke/trouble.nvim'

"pairs"
Plug 'windwp/nvim-autopairs'

"react snippets"
"Plug 'SirVer/ultisnips' "causing tab to not work
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround'
Plug 'folke/which-key.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

"snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'rafamadriz/friendly-snippets'

Plug 'xiyaowong/nvim-transparent'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'goolord/alpha-nvim'

Plug 'numToStr/Comment.nvim'

Plug 'MunifTanjim/nui.nvim'
Plug 'jackMort/ChatGPT.nvim'
"Plug 'github/copilot.vim'

call plug#end()


source ~/.config/nvim/plugins/lsp/lsp.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/trouble.vim
source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/lualine.vim
source ~/.config/nvim/plugins/nvim-cmp.vim
source ~/.config/nvim/plugins/lsp-signature.vim
source ~/.config/nvim/plugins/indent-blankline.vim
"source ~/.config/nvim/plugins/bufferline.vim
source ~/.config/nvim/plugins/dap.vim
source ~/.config/nvim/plugins/lua-snip.vim
source ~/.config/nvim/plugins/nvim-transparent.vim
source ~/.config/nvim/plugins/alpha-nvim.vim
source ~/.config/nvim/plugins/nvim-autopairs.vim
source ~/.config/nvim/plugins/gitsigns.vim
source ~/.config/nvim/plugins/nvim-colorizer.vim
source ~/.config/nvim/plugins/comment.vim
source ~/.config/nvim/plugins/whichkey.vim
source ~/.config/nvim/plugins/chatgpt.vim

