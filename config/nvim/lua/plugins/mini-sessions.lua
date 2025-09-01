return {
    'echasnovski/mini.sessions',
    version = '*',
    config = function()

        vim.keymap.set("n", "<Leader>sn", ":lua MiniSessions.write('')<Left><Left>")
        vim.keymap.set("n", "<Leader>ss", ":lua MiniSessions.write()<CR>")
        vim.keymap.set("n", "<Leader>sd", ":lua MiniSessions.delete('')<Left><Left>")
        vim.keymap.set("n", "<Leader>sg", ":lua print('Current Session: ' .. MiniSessions.get_latest())<CR>")

        require('mini.sessions').setup({
            -- Whether to read latest session if Neovim opened without file arguments
            autoread = false,

            -- Whether to write current session before quitting Neovim
            autowrite = true,

            -- Directory where global sessions are stored (use `''` to disable)
            --directory = --<"session" subdir of user data directory from |stdpath()|>,

            -- File for local session (use `''` to disable)
            file = '.nvim.session',

            -- Whether to force possibly harmful actions (meaning depends on function)
            force = { read = false, write = true, delete = false },

            -- Hook functions for actions. Default `nil` means 'do nothing'.
            -- Takes table with active session data as argument.
            hooks = {
            -- Before successful action
            pre = { read = nil, write = nil, delete = nil },
            -- After successful action
            post = { read = nil, write = nil, delete = nil },
            },

            -- Whether to print session path after action
            verbose = { read = false, write = true, delete = true },
        })
    end
}
