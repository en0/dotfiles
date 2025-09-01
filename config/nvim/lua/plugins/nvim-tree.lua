return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()

        -- Disable the built-in Explorer
        vim.g.loaded_netrw = true
        vim.g.loaded_netrwPlugin = true
        vim.opt.termguicolors = true

        -- Keys
        vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<CR>")
        vim.keymap.set('n', '<Leader>E', ":NvimTreeRefresh<CR>")

        -- Configure
        require("nvim-tree").setup({

            sort_by = "case_sensitive",

            open_on_tab = false,
            hijack_cursor = false,
            update_cwd = false,

            system_open = {cmd = nil, args = {}},
            view = {width = 30, side = "left"},

            diagnostics = {
                enable = true,
                -- I think these are all set by default now
                --icons = {
                    --hint = "󰍉",
                    --info = "",
                    --warning = "",
                    --error = "",
                --}
            },

            update_focused_file = {
                enable = true,
                update_cwd = false,
                ignore_list = {
                    '.cache',
                    '.git',
                    '.venv',
                    '__pycache__',
                    'docker_venv',
                    'node_modules',
                    'venv',
                }
            },

            renderer = {
                group_empty = false,
                add_trailing = false,
                highlight_git = "name",
                indent_markers = {enable = true},
                special_files = {'README.md', 'Makefile', 'MAKEFILE'},
            },

            filters = {
                dotfiles = true,
                custom = {
                    '__pycache__',
                    'docker_venv',
                    'node_modules',
                    'venv',
                }
            }
        })

    end
}
