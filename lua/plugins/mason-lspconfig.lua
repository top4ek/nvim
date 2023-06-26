return { "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  enabled = not os.getenv("LIGHT_NVIM")
}
