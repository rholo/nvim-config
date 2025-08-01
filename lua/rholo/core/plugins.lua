local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'christoomey/vim-tmux-navigator'
    use {
      'folke/flash.nvim',
      config = function()
        require("flash").setup({
          modes = {
            search = {
              enabled = true,
            },
          },
        })
      end,
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
      end,
    }
    use { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } }
    use {
      'ellisonleao/gruvbox.nvim'
    }
    use 'shinchu/lightline-gruvbox.vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox'
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      }
    end
    }
    use {
    'nvim-tree/nvim-tree.lua',
      opt = true,
      cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
      config = function()
        require("nvim-tree").setup {
          update_focused_file = {
            enable = true,
            update_cwd = true
          },
          view = {
            adaptive_size = true
          },
          actions = {
            open_file = {
              quit_on_open = true
            }
          },
          git = {
            enable = false,
            ignore = true
          },
          filters = {
            dotfiles = false,
            custom = {'.git/', 'node_modules', 'dist'}
          }
        }
    end
    }
    -- autocompletion
    use 'onsails/lspkind.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-cmdline'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- lsp server
    use 'neovim/nvim-lspconfig'

    -- lsp helpers
    use ({'glepnir/lspsaga.nvim', branch = 'main'})
    use ({'mg979/vim-visual-multi', branch = 'master'})

    -- linters
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
    }

    use "williamboman/mason.nvim"
    use 'williamboman/mason-lspconfig.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'github/copilot.vim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    profile = {
      enable = true,
      threshold = 1
    }
  }
})
