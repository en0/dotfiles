-- Some UI stuff
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "+0" -- Same as textwidth
vim.opt.updatetime = 1000 -- This makes hover and git icons faster

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Auto wordwrap
vim.opt.textwidth = 100
vim.opt.wrap = false

-- Filetype Overrides
vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost'}, {
    pattern = '*.md',
    command = 'set filetype=markdown'
})

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'make',
    command = 'setlocal noexpandtab'
})

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'crontab',
    command = 'setlocal bkc=yes'
})
