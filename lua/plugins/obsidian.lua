vim.pack.add {
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range "*"
  },
}

require("obsidian").setup {
  legacy_commands = false,
  daily_notes = {
    folder = "Journal",
    date_format = "YYYY/MM/DD",
    workdays_only = false,
  },
  workspaces = {
    {
      name = "my_vault",
      path = os.getenv("OBSIDIAN_VAULT_DIRECTORY"),
    },
  },
}

vim.keymap.set("n", "<Leader>oj", "<cmd>Obsidian today<CR>")
vim.keymap.set("n", "<Leader>oo", "<cmd>Obsidian<CR>")
