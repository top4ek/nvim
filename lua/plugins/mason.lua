vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
})

require("mason").setup()
require("mason-lspconfig").setup()

local registry = require("mason-registry")

local ensure_installed = {
  'angular-language-server',
  'ansible-language-server',
  'ansible-lint',
  'bash-language-server',
  'clangd',
  'css-lsp',
  'dockerfile-language-server',
  'eslint-lsp',
  'gopls',
  'herb-language-server',
  'html-lsp',
  'jinja-lsp',
  'json-lsp',
  'lua-language-server',
  'marksman',
  'python-lsp-server',
  'ruby-lsp',
  'rust-analyzer',
  'sqlls',
  'stimulus-language-server',
  'tailwindcss-language-server',
  'typescript-language-server',
  'yaml-language-server',
}

registry.refresh(vim.schedule_wrap(function()
  for _, name in ipairs(ensure_installed) do
    local ok, pkg = pcall(registry.get_package, name)
    if not ok then
      vim.notify(("mason: unknown package %q"):format(name), vim.log.levels.WARN)
    elseif not pkg:is_installed() and not pkg:is_installing() then
      pkg:install()
    end
  end
end))

vim.api.nvim_create_autocmd("LspAttach", {
  desc = 'LSP actions',
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }
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
