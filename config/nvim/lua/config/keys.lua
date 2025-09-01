vim.g.mapleader = ","
vim.g.maplocalleader = "<space>"

-- Buffer Nav -- these get reset in barbar
vim.keymap.set('n', '<Leader>n', ":bp<CR>")
vim.keymap.set('n', '<Leader>m', ":bn<CR>")
vim.keymap.set('n', '<Leader>c', ":bd<CR>")

-- Window Nav
vim.keymap.set('n', '<C-h>', "<C-w>h")
vim.keymap.set('n', '<C-j>', "<C-w>j")
vim.keymap.set('n', '<C-k>', "<C-w>k")
vim.keymap.set('n', '<C-l>', "<C-w>l")

-- Clear search highlight
vim.keymap.set('n', '<C-n>', ":nohl<CR>")

-- Indent Control
vim.keymap.set('v', '<', "<gv")
vim.keymap.set('v', '>', ">gv")

-- Spell Check
vim.keymap.set('n', '<F5>', ":setlocal spell! spelllang=en_us<CR>")

-- You know why
vim.api.nvim_create_user_command("WW", "w !sudo tee %", {})

-- Python Stuff
vim.api.nvim_create_autocmd('FileType', {
     desc = 'Customizations for python file types.',
     pattern = 'python',
     group = vim.api.nvim_create_augroup('python-custom', {clear = true}),
     callback = function ()
         vim.keymap.set('n', '<Leader>pp', 'oimport pdb; pdb.set_trace()<ESCAPE>')
         vim.keymap.set('n', '<Leader>pP', 'koimport pdb; pdb.set_trace()<ESCAPE>')
         vim.keymap.set('n', '<Leader>pi', ':!isort %<CR>')
         vim.keymap.set('n', '<Leader>pb', ':!black %<CR>')
     end,
})
