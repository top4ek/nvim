vim.pack.add({
  "https://github.com/echasnovski/mini.animate",
  "https://github.com/echasnovski/mini.bufremove",
  "https://github.com/echasnovski/mini.cursorword",
  "https://github.com/echasnovski/mini.indentscope",
  "https://github.com/echasnovski/mini.pairs",
})

require('mini.animate').setup({
  cursor = {
    enable = false
  }
})

require('mini.bufremove').setup()

require('mini.cursorword').setup({
  delay = 500
})

require('mini.indentscope').setup()

require('mini.pairs').setup()
