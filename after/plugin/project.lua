local ok, project = pcall(require, "project_nvim")
if not ok then return end

project.setup {
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
}
