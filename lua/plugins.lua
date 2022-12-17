local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd.packadd('packer.nvim')
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim'
  -- use { 'ellisonleao/gruvbox.nvim',

  use 'ahmedkhalf/project.nvim'
  use 'arkav/lualine-lsp-progress'
  use 'danilamihailov/beacon.nvim'
  use 'editorconfig/editorconfig-vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'nathom/filetype.nvim'
  use 'numToStr/Comment.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'RRethy/nvim-treesitter-endwise'
  use 'ojroques/nvim-bufdel'
  use 'petertriho/nvim-scrollbar'
  use 'wakatime/vim-wakatime'
  use 'windwp/nvim-autopairs'

  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  use {
    { 'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      cmd = 'Telescope',
      module = 'telescope',
    },
    { 'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    }
  }

  use { 'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  if not os.getenv("LIGHT_NVIM") then
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
  end

  use 'VonHeikemen/lsp-zero.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
