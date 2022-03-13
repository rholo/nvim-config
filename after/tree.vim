lua << EOF
local nvimtree = require('nvim-tree')
nvimtree.setup {
  auto_close = true,
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  filters = {
    custom = {'.git', 'node_modules'}
  },
  view = {
    auto_resize = true
    } 
  }
EOF
