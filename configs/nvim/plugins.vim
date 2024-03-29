call plug#begin('~/.vim/plugged')

" Plug 'morhetz/gruvbox'
Plug 'ValdemarGr/gruvbox'
Plug 'ValdemarGr/gruvbox-baby', { 'branch': 'main' }
" Plug 'luisiacc/gruvbox-baby'
" Plug '~/git/gruvbox-baby'
"
Plug 'sainnhe/gruvbox-material', { 'branch': 'master' }
Plug 'sainnhe/everforest', { 'branch': 'master' }
Plug 'rafamadriz/neon'
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'mbbill/undotree'

"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'kyazdani42/nvim-tree.lua'

"Plug 'junegunn/goyo.vim'

Plug 'lifepillar/pgsql.vim'
"Plug 'google/vim-maktaba'
"Plug 'bazelbuild/vim-bazel'
"Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
"Plug 'guns/vim-sexp'
"Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'hashivim/vim-terraform'

Plug 'farmergreg/vim-lastplace'
Plug 'vimwiki/vimwiki'

"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim' " , { 'commit': '9d81624fbcedd3dd43b38d7e13a1e7b3f873d8cd' } 
Plug 'nvim-telescope/telescope.nvim'

" Plug 'ray-x/lsp_signature.nvim'

" Plug 'nvim-telescope/telescope-github.nvim'
" Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'tami5/sql.nvim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-web-devicons'

Plug 'scalameta/nvim-metals' " , { 'commit': '054cda0af4f06a01814055079e5a169dc8afd78c'}
Plug 'neovim/nvim-lspconfig'
" Plug 'jparise/vim-graphql'
" Plug 'glepnir/lspsaga.nvim'

"Plug 'joshdick/onedark.vim'
Plug 'phaazon/hop.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'petertriho/cmp-git'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-copilot'
Plug 'ray-x/cmp-treesitter'

" Plug 'hoob3rt/lualine.nvim'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'rescript-lang/vim-rescript'
", { 'do': 'bash ~/.config/nvim/install-rescript-lsp.sh' }

Plug 'L3MON4D3/LuaSnip'
" Plug 'justinmk/vim-sneak'

" Plug 'google/vim-maktaba'
" Plug 'bazelbuild/vim-bazel'
Plug 'lakshayg/vim-bazel'

Plug 'BeneCollyridam/futhark-vim'

Plug 'ThePrimeagen/harpoon'

Plug 'cocopon/iceberg.vim'
Plug 'vim-scripts/wombat256.vim'
Plug 'jaredgorski/spacecamp'
Plug 'sainnhe/sonokai'
Plug 'nanotech/jellybeans.vim'

Plug 'github/copilot.vim'
" Plug 'nvim-telescope/telescope-ui-select.nvim'
" Plug 'lewis6991/gitsigns.nvim'

" Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'AckslD/nvim-neoclip.lua'

call plug#end()


