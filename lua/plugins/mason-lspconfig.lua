return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  cond = not os.getenv("LIGHT_NVIM"),
  opts = {
    ensure_installed = {
      'angularls',
      'ansiblels',
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'eslint',
      'gopls',
      'html',
      'jsonls',
      'lua_ls',
      'marksman',
      'pylsp',
      'ruby_lsp',
      'rust_analyzer',
      'sqlls',
      'stimulus_ls',
      'tailwindcss',
      'ts_ls',
      'yamlls'
    },
    automatic_enable = {
      'angularls',
      'ansiblels',
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'eslint',
      'gopls',
      'html',
      'jsonls',
      'lua_ls',
      'marksman',
      'pylsp',
      'ruby_lsp',
      'rust_analyzer',
      'sqlls',
      'stimulus_ls',
      'tailwindcss',
      'ts_ls',
      'yamlls'
    }
  }
}
