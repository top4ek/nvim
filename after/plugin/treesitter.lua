local ok, installer = pcall(require, "nvim-treesitter.install")
if not ok then return end

installer.update({ with_sync = true })

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup {
	ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "mermaid",
    "python",
    "regex",
    "ruby",
    "rust",
    "sql",
    "toml",
    "yaml"
  },
  sync_install = false,
	auto_install = true,
  indent = {
    enable = true
  },
	endwise = {
		enable = true
	},
	highlight = {
    additional_vim_regex_highlighting = false,
		enable = true
	}
}

local opt = vim.opt
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local ok, context = pcall(require, "treesitter-context")
if ok then
  context.setup { enable = true }
end
