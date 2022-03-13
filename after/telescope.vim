lua << EOF

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    prompt_prefix = "👽 ",
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    color_devicons = true,
    file_ignore_patters = {"node_modules", "dist", "%yarn"},
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
EOF
