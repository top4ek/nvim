return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  cond = not os.getenv("LIGHT_NVIM"),
  config = function()
    vim.lsp.config('ruby_lsp', {
      cmd = { "asdf", "exec", "ruby-lsp" },
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })
  end
}
