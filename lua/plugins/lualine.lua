return {
  'nvim-lualine/lualine.nvim',
  event = { 'VimEnter' },
  dependencies = { 'linrongbin16/lsp-progress.nvim' },
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },

        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { [[vim.api.nvim_win_get_number(0)]], 'filename', 'aerial' },
        lualine_x = { 'b:gitsigns_blame_line', require("lsp-progress").progress, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }

    vim.cmd([[
    augroup lualine_augroup
        autocmd!
        autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
    augroup END
    ]])
  end
}
