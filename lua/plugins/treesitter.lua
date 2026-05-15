vim.pack.add({
  "https://github.com/romus204/tree-sitter-manager.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("tree-sitter-manager").setup({
  highlight = true,
  parsers = {
    "bash",
    "c",
    "cpp",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "html",
    "ini",
    "javascript",
    "json",
    "json5",
    "lua",
    "luap",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "nginx",
    "nix",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "sql",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
})

vim.treesitter.language.register("tsx", { "typescriptreact" })
vim.treesitter.language.register("jsx", { "javascriptreact" })

require("render-markdown").setup({})
require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@class.outer"] = "<c-v>",
    },
    include_surrounding_whitespace = false,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
})
