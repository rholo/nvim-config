local st, mason = pcall(require, 'mason')
if (not st) then return end
local st2, lspconfig = pcall(require, 'mason-lspconfig')
if (not st2) then return end

mason.setup({
  PATH = 'skip'
})

lspconfig.setup {
  automatic_installation = true
}
