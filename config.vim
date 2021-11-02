
"let g:closetag_filenames = '*.html,*.js'
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox 

set completeopt=menuone,noinsert,noselect

let g:nvim_tree_quit_on_open = 1

lua << EOF
local lualine = require('lualine')
lualine.setup({
  options = {
    theme = 'gruvbox',
    icons_enabled = true
  }
})

local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup {
  on_attach =require'completion'.on_attach  
}
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'json', 'css', 'scss' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      }
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint'
    }
  }
}

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    prompt_prefix = "👽 ",
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    color_devicons = true,
    file_ignore_patters = {"node_modules", ".temp", "dist", "%yarn"},
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      n = {
        ["q"] = actions.close
      } 
    }
  }
}

local nvimtree = require('nvim-tree')
nvimtree.setup {
  auto_close = true,
  filters = {
    custom = {'.git', 'node_modules', '.cache', '.tmp'}
  },
  view = {
    auto_resize = true
    } 
  }
EOF
