local ok, telescope = pcall(require, "telescope")
if not ok then return end

telescope.setup {
  defaults = {
    layout_strategy = 'vertical',
    scroll_strategy = 'limit',
    layout_config = {
      vertical = { height = 0.95, width = 0.95 }
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

telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'
telescope.load_extension 'projects'
telescope.load_extension 'undo'
