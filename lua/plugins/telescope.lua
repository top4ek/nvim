return { "nvim-telescope/telescope.nvim",
  dependencies = {
    "ahmedkhalf/project.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "plenary.nvim",
    "popup.nvim",
    "stevearc/aerial.nvim"
  },
  cmd = "Telescope",
  config = function ()
    local telescope = require("telescope")
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

    telescope.load_extension 'aerial'
    telescope.load_extension 'frecency'
    telescope.load_extension 'fzf'
    telescope.load_extension 'projects'
    telescope.load_extension 'ui-select'
    telescope.load_extension 'undo'
  end
}
