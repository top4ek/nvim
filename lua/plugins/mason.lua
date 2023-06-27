return { "williamboman/mason.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  cond = not os.getenv("LIGHT_NVIM")
}
