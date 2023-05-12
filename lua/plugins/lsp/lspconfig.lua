local status, lsp_config = pcall(require, 'lspconfig')
if (not status)  then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

lsp_config.tsserver.setup {
  on_attach = on_attach,
  filetypes = {'typescript', 'typescriptreact', 'typescript.tsx', 'javascript'},
  cmd = { "typescript-language-server", "--stdio"},
  underline = true
}

