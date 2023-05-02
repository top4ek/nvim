local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  'navarasu/onedark.nvim',
  -- 'ellisonleao/gruvbox.nvim',

  'stevearc/aerial.nvim',
  'ahmedkhalf/project.nvim',
  'arkav/lualine-lsp-progress',
  'kyazdani42/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
  'nathom/filetype.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'RRethy/nvim-treesitter-endwise',
  'wakatime/vim-wakatime',
  'nvim-tree/nvim-tree.lua',

  'echasnovski/mini.animate',
  'echasnovski/mini.bufremove',
  'echasnovski/mini.comment',
  'echasnovski/mini.cursorword',
  'echasnovski/mini.indentscope',
  'echasnovski/mini.pairs',
  'jinh0/eyeliner.nvim',

  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'rafamadriz/friendly-snippets',

  'VonHeikemen/lsp-zero.nvim',

  { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },
  { 'akinsho/bufferline.nvim', dependencies = 'kyazdani42/nvim-web-devicons' },

  {
    { 'nvim-telescope/telescope.nvim',
      dependencies = {
        'debugloop/telescope-undo.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'plenary.nvim',
        'popup.nvim'
      },
      cmd = 'Telescope',
    },
    { 'nvim-telescope/telescope-frecency.nvim', dependencies = 'tami5/sqlite.lua' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
}
  if not os.getenv("LIGHT_NVIM") then
    table.insert(plugins, 'neovim/nvim-lspconfig')
    table.insert(plugins, 'williamboman/mason.nvim')
    table.insert(plugins, 'williamboman/mason-lspconfig.nvim')
  end

require("lazy").setup(plugins, opts)
