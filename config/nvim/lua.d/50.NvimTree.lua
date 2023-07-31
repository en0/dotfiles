-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({

  sort_by = "case_sensitive",

  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,

  diagnostics = {

    enable = true,

    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }

  },

  update_focused_file = {

    enable      = true,
    update_cwd  = false,

    ignore_list = {
        '.git',
        'node_modules',
        '.cache',
        '__pycache__',
        'venv',
        '.venv',
        'docker_venv'
    }
  },

  system_open = {

    cmd  = nil,
    args = {}

  },


  view = {

    width = 30,
    hide_root_folder = false,
    side = 'left',

    mappings = {
      custom_only = false,
      list = {}
    }

  },

  renderer = {

    group_empty = true,
    add_trailing = true,
    root_folder_modifier = ':~',
    highlight_git = true,
    indent_markers = { enable = true },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE' },

    icons = {

      show = {
        git = true,
        folder = true,
        file = true,
      },

      glyphs = {

        default = '',
        symlink = '',

        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "ﰴ",
          untracked = "",
          deleted = "",
          ignored = "﯏"
        },

        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },

        --lsp = {
          --hint = "",
          --info = "",
          --warning = "",
          --error = "",
        --}
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = {
        'node_modules',
        '__pycache__',
        'venv',
        'docker_venv'
    }
  }
})
