return {
  'saghen/blink.cmp',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'super-tab',
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-e>'] = { 'hide' },
    },
    appearance = {
      nerd_font_variant = 'normal'
    },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'omni',
        'buffer'
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
