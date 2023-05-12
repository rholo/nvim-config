vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- basic use
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>qq', ':q!<CR>', opts)
vim.keymap.set('n', '<Leader>cb', ':bd<CR>', opts)
vim.keymap.set('n', '<Leader>rg', ':Rg<CR>', opts)
vim.keymap.set('n', '<Leader>f', ':GFiles<CR>', opts)
vim.keymap.set('n', '<Leader>r', ':%s//g<Left><Left>', opts)
vim.keymap.set('n', '<Leader>e', ':e<CR>', opts)

-- nvim-tree
vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<Leader>rn', ':NvimTreeRefresh<CR>', opts)

-- telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<Leader>fw', ':Telescope grep_string<CR>', opts)
vim.keymap.set('n', '<Leader>gs', ':Telescope git_status<CR>', opts)
vim.keymap.set('n', '<Leader>gc', ':Telescope git_commits<CR>', opts)
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>', opts)

-- easymotion
-- nmap <Leader>s <Plug>(easymotion-s2)
vim.keymap.set('n', '<Leader>s', '<Plug>(easymotion-s2)', opts)
