vim.cmd('autocmd!')

local opt = vim.opt

opt.mouse = "a"
opt.title = true
opt.number = true
opt.relativenumber = true
-- opt.noerrorbells = true
opt.expandtab = true
opt.ruler = true
opt.showcmd = true
opt.smartindent = true
opt.ai = true -- auto-indent
opt.si = true -- smart-indent
opt.numberwidth = 1
opt.wrap = false -- no wrap lines
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.sw = 2
opt.laststatus = 2
opt.shiftround = true
opt.cursorline = true
opt.colorcolumn = "90"
opt.encoding = "utf-8"
opt.fileencoding = "UTF-8"
opt.showmatch = true
opt.termguicolors = true
opt.autoread = true
opt.smartcase = true
opt.backspace = "start,eol,indent"
-- opt.path:append { ** } -- find files deep
opt.wildignore:append { '*/node_modules/*' }
opt.clipboard:append("unnamedplus")
opt.backup = false
opt.completeopt = "menu,menuone,noinsert,noselect"
opt.ignorecase = true
opt.backupskip = '/tmp/*,/private/tmp/*'
--opt.nowritebackup = true
--opt.noshowmode = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
-- Turn off paste mode when leaving INSERT
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

