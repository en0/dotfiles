" Do i still need this in neovim 0.5+?
let g:python3_host_prog='$HOME/.config/nvim/venv/bin/python'

"syntax on
set nu
"set relativenumber
set ruler
set cursorline
set scrolloff=10

"auto indent
"set ai
"filetype indent plugin on

" use system clipboard
set clipboard+=unnamedplus

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set sta
set expandtab
set noshowmode

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable swap
set nobackup
set nowritebackup
set noswapfile

"auto wordwrap
set tw=80
set nowrap
set fo-=t

"color bar
set colorcolumn=88

"enable mouse
set mouse=a mousemodel=popup

" buffer switching (unsaved)
set hidden
