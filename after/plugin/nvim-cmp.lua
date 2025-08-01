local cmp_status, cmp = pcall(require, "cmp")
  if (not cmp_status) then return end

local lspkind = require 'lspkind'

cmp.setup({
  mapping = cmp.mapping.preset.insert({
   ["<C-k>"] = cmp.mapping.select_prev_item(),
   ["<C-j>"] = cmp.mapping.select_next_item(),
   ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    {name = "nvim_lsp"},
    {name = "buffer"},
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = '...',
      before = function (entry, vim_item)
        return vim_item
      end
    }),
  },
})
