local status, lsp_config = pcall(require, 'lspconfig')
if (not status) then return end

-- local protocol = require('vim.lsp.protocol')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Remove diagnostic label inline
vim.diagnostic.config({
  virtual_text = false
})

-- Add custom icons
local signs = { Error = "󰠭", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- Custom diagnostic message
function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

lsp_config.tsserver.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}
lsp_config.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lsp_config.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
