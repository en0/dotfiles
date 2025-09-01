return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()

        vim.keymap.set('n', '<Leader>t', ":TodoFzfLua<CR>")

        require('todo-comments').setup({

            signs = true,
            sign_priority = 8,

            keywords = {
                FIX = {icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }},
                TODO = { icon = " ", color = "hint" },
                HACK = { icon = " ", color = "error" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
                PERF = { icon = "󰾆 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                TEST = { icon = "󰙨 ", color = "hint", alt = { "TESTING", "PASSED", "FAILED" } },
            },

            gui_style = {fg = "NONE", bg = "BOLD"},

            merge_keywords = true,

            highlight = {
                multiline = true,
                multiline_pattern = "^.",
                multiline_context = 10,
                before = "",
                keyword = "wide",
                after = "fg",
                pattern = [[.*<(KEYWORDS)\s*:]],
                comments_only = true,
                max_line_len = 400,
                exclude = {},
            },

            search = {
                command = "rg",
                pattern = [[\b(KEYWORDS)\b]],
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
            }
        })
    end
}
