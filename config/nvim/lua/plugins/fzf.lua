return {
    'ibhagwan/fzf-lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()

        vim.keymap.set('n', '<Leader>f', ":FzfLua files<CR>")
        vim.keymap.set('n', '<Leader>b', ":FzfLua buffers<CR>")
        vim.keymap.set('n', '<C-f>', ":FzfLua live_grep<CR>")
        vim.keymap.set('n', '<C-F>', ":FzfLua live_grep_resume<CR>")

        require('fzf-lua').setup({})
    end
}
