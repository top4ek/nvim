return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets"
  },
  config = function ()
    local lsp = require("lsp-zero")
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
      'pylsp',
      'rust_analyzer',
      'solargraph',
      'tsserver',
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
  end
}
