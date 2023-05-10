local opt = vim.opt

opt.mouse = "a"
opt.title = true
opt.number = true
opt.relativenumber = true
--opt.noerrorbells = true
opt.expandtab = true
opt.ruler = true
opt.showcmd = true
opt.smartindent = true
opt.numberwidth = 1
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
--opt.nowritebackup = true
--opt.noshowmode = true
opt.ignorecase = true
opt.smartcase = true
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

opt.completeopt = "menu,menuone,noinsert,noselect"