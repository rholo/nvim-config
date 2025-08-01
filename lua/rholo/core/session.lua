local M = {}

function M.save()
  vim.cmd("mks! ~/.config/nvim/Session.vim")
end

function M.load()
  vim.cmd("source ~/.config/nvim/Session.vim")
end

return M
