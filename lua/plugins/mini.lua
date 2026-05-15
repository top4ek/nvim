vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.animate',     version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.bufremove',   version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.cmdline',     version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.cursorword',  version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.indentscope', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pairs',       version = 'stable' },
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
