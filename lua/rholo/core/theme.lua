
-- vim.g:gruvbox_contrast_dark = "hard"

-- vim.g:gruvbox_transparent_bg = 1

-- colorscheme gruvbox 

-- hi Normal guibg=NONE
require("gruvbox").setup({
  transparent_mode = true
})
vim.cmd([[colorscheme gruvbox]])

-- flash.nvim highlights
vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#1d2021", bg = "#fabd2f" })

