return {
  "ahmedkhalf/project.nvim",
  keys = {
    { "<Leader>fp", "<cmd>Telescope projects<CR>" },
  },
  config = function()
    require("project_nvim").setup {
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "index.norg" }
    }
    require('telescope').load_extension 'projects'
  end
}
