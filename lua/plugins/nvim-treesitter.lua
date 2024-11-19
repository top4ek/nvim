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
        "c",
        "cpp",
        "csv",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "sql",
        "sql",
        "toml",
        "vim",
        "vimdoc",
        "xml",
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
