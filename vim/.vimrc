filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()
" filetype plugin indent on
syntax enable
colorscheme sunburst
set ai
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

set diffopt+=iwhite
" Plugin 'elixir-lang/vim-elixir" 
" Plugin 'ekalinin/Dockerfile.vim'
