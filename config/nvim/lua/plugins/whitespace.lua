return {
    'ntpeters/vim-better-whitespace',
    config = function()
        vim.g.better_whitespace_guicolor = "#a9635d"
        vim.g.better_whitespace_enabled = true
        vim.g.strip_whitespace_on_save = true
    end
}
