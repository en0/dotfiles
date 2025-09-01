return {
    'liuchengxu/vim-which-key',
    config = function()
        vim.keymap.set('n', '<Leader>', ":WhichKey ','<CR>")
    end
}
