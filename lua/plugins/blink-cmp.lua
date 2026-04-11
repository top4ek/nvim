vim.pack.add({
  'https://github.com/kristijanhusak/vim-dadbod-ui',
  'https://github.com/rafamadriz/friendly-snippets',
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") }
})

local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = group,
  once = true,
  callback = function()
    require("blink.cmp").setup({
      keymap = {
        preset = 'super-tab',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-e>'] = { 'hide' },
      },
      appearance = { nerd_font_variant = "mono", use_nvim_cmp_as_default = true, },
      completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = { dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" } },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
})
