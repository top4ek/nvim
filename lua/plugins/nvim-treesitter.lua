return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "nvim-treesitter/nvim-treesitter-context"
  },
  build = function()
    require("nvim-treesitter.install").update { with_sync = true }
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
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
    require("treesitter-context").setup { enable = true }
  end
}
