return { "williamboman/mason.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  enabled = not os.getenv("LIGHT_NVIM")
}
