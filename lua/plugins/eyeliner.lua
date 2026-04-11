vim.pack.add { "https://github.com/jinh0/eyeliner.nvim" }

require('eyeliner').setup({
  highlight_on_key = true,
  dim = true,
  max_length = 1024,
  disabled_filetypes = {},
  disabled_buftypes = {},
  default_keymaps = true,
})
