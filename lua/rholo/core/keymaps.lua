vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- basic use
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
-- vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>q', function()
  local choice = vim.fn.confirm("Are you sure you want to quit?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.cmd("q")
  end
end, opts)
vim.keymap.set('n', '<leader>qq', ':q!<CR>', opts)
vim.keymap.set('n', '<Leader>cb', ':bd<CR>', opts)
vim.keymap.set('n', '<Leader>rg', ':Rg<CR>', opts)
vim.keymap.set('n', '<Leader>f', ':GFiles<CR>', opts)
vim.keymap.set('n', '<Leader>r', ':%s//g<Left><Left>', opts)
vim.keymap.set('n', '<Leader>e', ':e!<CR>', opts)

-- nvim-tree
vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<Leader>rn', ':NvimTreeRefresh<CR>', opts)

-- fzf-lua
-- Archivos en el proyecto
vim.keymap.set('n', '<Leader>ff', '<cmd>FzfLua files<CR>', opts)
-- Grep en vivo (usa ripgrep)
vim.keymap.set('n', '<Leader>fg', '<cmd>FzfLua live_grep<CR>', opts)
-- Buscar la palabra bajo el cursor
vim.keymap.set('n', '<Leader>fw', '<cmd>FzfLua grep_cword<CR>', opts)
-- Git: estado actual (archivos modificados)
vim.keymap.set('n', '<Leader>gs', '<cmd>FzfLua git_status<CR>', opts)
-- Git: commits (historial)
vim.keymap.set('n', '<Leader>gc', '<cmd>FzfLua git_commits<CR>', opts)
-- Buffers abiertos
vim.keymap.set('n', '<Leader>b',  '<cmd>FzfLua buffers<CR>', opts)

-- flash.nvim
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- easymotion

-- session
vim.keymap.set("n", "<leader>ss", function()
  require("rholo.core.session").save()
end, { desc = "Save session" })

vim.keymap.set("n", "<leader>sl", function()
  require("rholo.core.session").load()
end, { desc = "load session" })

vim.api.nvim_create_user_command("SaveSession", function()
  require("rholo.core.session").save()
end, {})

vim.api.nvim_create_user_command("LoadSession", function()
  require("rholo.core.session").load()
end, {})
