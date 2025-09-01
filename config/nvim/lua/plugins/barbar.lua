return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    config = function()

        -- Buffer Nav
        vim.keymap.set('n', '<Leader>m', ":BufferNext<CR>")
        vim.keymap.set('n', '<Leader>n', ":BufferPrevious<CR>")
        vim.keymap.set('n', '<Leader>c', ":BufferClose<CR>")
        vim.keymap.set('n', '<C-1>', ":BufferGoto 1<CR>")
        vim.keymap.set('n', '<C-2>', ":BufferGoto 2<CR>")
        vim.keymap.set('n', '<C-3>', ":BufferGoto 3<CR>")
        vim.keymap.set('n', '<C-4>', ":BufferGoto 4<CR>")
        vim.keymap.set('n', '<C-5>', ":BufferGoto 5<CR>")
        vim.keymap.set('n', '<C-6>', ":BufferGoto 6<CR>")
        vim.keymap.set('n', '<C-7>', ":BufferGoto 7<CR>")
        vim.keymap.set('n', '<C-8>', ":BufferGoto 8<CR>")
        vim.keymap.set('n', '<C-9>', ":BufferGoto 9<CR>")

        vim.keymap.set('n', '<Leader>M', ":BufferMoveNext<CR>")
        vim.keymap.set('n', '<Leader>N', ":BufferMovePrevious<CR>")


        vim.g.barbar_auto_setup = false
        require('barbar').setup({
            animation = false,
            auto_hide = false,
        })
    end
}
