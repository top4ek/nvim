vim.pack.add({ "https://github.com/ahmedkhalf/project.nvim" })

require("project_nvim").setup({
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "index.norg" }
})

require('telescope').load_extension 'projects'

vim.keymap.set('n', "<Leader>fp", "<cmd>Telescope projects<CR>")
