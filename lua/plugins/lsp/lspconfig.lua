local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  return
end

local cmp_nevim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nevim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)

  if client.name == 'tsserver' then
    keymap.set('n', '<leader>rn', ':TypescriptRenameFile<CR>', {noremap = true, silent = true, buffer = bufnr})
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})
lspconfig['cssls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})
