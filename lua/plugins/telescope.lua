vim.pack.add({
  "https://github.com/ahmedkhalf/project.nvim",
  "https://github.com/debugloop/telescope-undo.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-lua/popup.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/stevearc/aerial.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope.nvim"
})


vim.keymap.set('n', "<Leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set('n', "<Leader>fa", "<cmd>Telescope aerial<CR>")
vim.keymap.set('n', "<Leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set('n', "<Leader>fd", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set('n', "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
vim.keymap.set('n', "<Leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set('n', "<Leader>fr", "<cmd>Telescope registers<CR>")
vim.keymap.set('n', "<Leader>fu", "<cmd>Telescope undo<CR>")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    scroll_strategy = 'limit',
    layout_config = {
      vertical = { height = 0.95, width = 0.95 },
      horizontal = { height = 0.95, width = 0.95 }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
  },
}

telescope.load_extension "frecency"
telescope.load_extension "fzf"
telescope.load_extension 'aerial'
telescope.load_extension 'ui-select'
telescope.load_extension 'undo'
