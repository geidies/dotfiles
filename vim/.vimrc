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
autocmd FileType perl setlocal equalprg=perltidy\ -st\ -l=120
autocmd FileType perl setlocal tabstop=4
autocmd FileType perl setlocal shiftwidth=4

execute pathogen#infect()
" filetype plugin indent on
syntax enable
let g:alduin_Contract_Vampirism = 1
let g:alduin_Shout_Aura_Whisper = 1
let g:alduin_Shout_Fire_Breath = 0
" colorscheme alduin
set ai
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

" set diffopt+=white
" Plugin 'elixir-lang/vim-elixir" 
" Plugin 'ekalinin/Dockerfile.vim'
