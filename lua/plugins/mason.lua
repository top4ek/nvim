vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'angularls',
    'ansiblels',
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'eslint',
    'gopls',
    'herb_ls',
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
    'herb_ls',
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
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = true })
    end

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})

vim.lsp.config('ruby_lsp', {
  cmd = { "asdf", "exec", "ruby-lsp" },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
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
