call plug#begin('~/.vim/plugged')

Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'hashivim/vim-terraform'
Plug 'preservim/nerdtree'

Plug 'junegunn/goyo.vim'
Plug 'vlime/vlime', {'rtp': 'vim/'}

Plug 'lifepillar/pgsql.vim'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'farmergreg/vim-lastplace'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'ryanoasis/vim-devicons'
"Plug 'petobens/poet-v'

Plug 'stsewd/fzf-checkout.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'scalameta/nvim-metals'

Plug 'joshdick/onedark.vim'
Plug 'antoinemadec/coc-fzf'

Plug 'hrsh7th/nvim-compe'

call plug#end()


