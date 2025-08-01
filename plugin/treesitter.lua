local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

treesitter.setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'html',
    'css'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
