return {
  'hrsh7th/nvim-cmp',
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  config = true,
  opts = function()
    local cmp = require("cmp")
    local luasnip = require('luasnip')
    local defaults = require("cmp.config.default")()

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      matching = {
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vim-dadbod-completion" },
        { name = 'buffer' },
        { name = "path" },
        { name = 'luasnip' }
      }),
      sorting = defaults.sorting,
    }
  end
}
