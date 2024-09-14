call plug#begin()
    " https://github.com/neoclide/coc.nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " https://github.com/kevinoid/vim-jsonc
    Plug 'kevinoid/vim-jsonc'

    " https://github.com/yuki-yano/fzf-preview.vim#installation
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " https://github.com/nvim-treesitter/nvim-treesitter
    Plug 'nvim-treesitter/nvim-treesitter'

    " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'nvim-lualine/lualine.nvim'

    " https://github.com/kyazdani42/nvim-tree.lua
    Plug 'nvim-tree/nvim-web-devicons' " optional
    Plug 'nvim-tree/nvim-tree.lua'

    " https://github.com/romgrk/barbar.nvim
    Plug 'romgrk/barbar.nvim'

    " https://github.com/liuchengxu/vim-which-key
    Plug 'liuchengxu/vim-which-key'

    " https://github.com/ntpeters/vim-better-whitespace
    Plug 'ntpeters/vim-better-whitespace'

    " https://github.com/mhinz/vim-startify
    "Plug 'mhinz/vim-startify'
    Plug 'echasnovski/mini.nvim'

    " https://github.com/airblade/vim-gitgutter
    Plug 'airblade/vim-gitgutter'

    " https://github.com/rhysd/git-messenger.vim
    Plug 'rhysd/git-messenger.vim'

    " https://github.com/EdenEast/nightfox.nvim
    Plug 'EdenEast/nightfox.nvim'

    " https://github.com/christoomey/vim-tmux-navigator
    Plug 'christoomey/vim-tmux-navigator'

    " https://github.com/folke/todo-comments.nvim
    Plug 'folke/todo-comments.nvim'

    " https://github.com/David-Kunz/gen.nvim
    Plug 'David-Kunz/gen.nvim'

    Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
call plug#end()
