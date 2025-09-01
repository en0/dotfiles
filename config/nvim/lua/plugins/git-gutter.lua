return {
    'airblade/vim-gitgutter',
    config = function()

        vim.opt.signcolumn = "yes"
        vim.g.gitgutter_map_keys = false
        vim.g.gitgutter_grep = "rg"

        -- Double bound because nav keys should be short
        vim.keymap.set('n', 'gj', ":GitGutterNextHunk<CR>")
        vim.keymap.set('n', 'gk', ":GitGutterPrevHunk<CR>")

        vim.keymap.set('n', '<Leader>gn', ":GitGutterNextHunk<CR>")
        vim.keymap.set('n', '<Leader>gp', ":GitGutterPrevHunk<CR>")
        vim.keymap.set('n', '<Leader>gf', ":GitGutterFold<CR>")
        vim.keymap.set('n', '<Leader>gs', ":GitGutterStageHunk<CR>")
        vim.keymap.set('n', '<Leader>gu', ":GitGutterUndoHunk<CR>")
        vim.keymap.set('n', '<Leader>gd', ":GitGutterDiffOrig<CR>")

    end
}
