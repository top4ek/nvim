local ok, lsp = pcall(require, "lsp-zero")
if not ok then return end

lsp.preset('recommended')
lsp.ensure_installed({
  'ansiblels',
  'bashls',
  'dockerls',
  'gopls',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'openscad_lsp',
  -- 'ruby_ls',
  'rust_analyzer',
  'solargraph',
  'yamlls'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ['<Tab>'] = nil,
  ['<S-Tab>'] = nil,
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

local lsp_opts = { flags = { debounce_text_changes = 150 } }
lsp.setup_servers({ opts = lsp_opts })

lsp.setup()

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
