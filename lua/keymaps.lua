vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>qq', ':q!<CR>', opts)

vim.keymap.set('n', '<Leader>cb', ':bd<CR>', opts)
vim.keymap.set('n', '<Leader>rg', ':Rg<CR>', opts)
vim.keymap.set('n', '<Leader>f', ':GFiles<CR>', opts)
vim.keymap.set('n', '<Leader>r', ':%s//g<Left><Left>', opts)
vim.keymap.set('n', '<Leader>e', ':e<CR>', opts)

vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<Leader>rn', ':NvimTreeRefresh<CR>', opts)
