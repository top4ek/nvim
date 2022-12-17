local command = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

local trim_group = group('Trim', { clear = true })
command('BufWritePre', {
  pattern = '*',
  group = trim_group,
  callback = function()
    vim.cmd([[:silent! %s/\s\+$//e]])
    vim.cmd([[:silent! %s/\%^\n\+//]])
    vim.cmd([[:silent! %s/\($\n\s*\)\+\%$//]])
  end
})

local highlight_group = group('YankHighlight', { clear = true })
command('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

command('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 3000)
  end
})
