local command = vim.api.nvim_create_autocmd

-- local function augroup(name)
--   return vim.api.nvim_create_augroup('augroup' .. name, {})
-- end

command('BufWritePre', {
  callback = function()
    vim.cmd([[:silent! %s/\s\+$//e]])
    vim.cmd([[:silent! %s/\%^\n\+//]])
    vim.cmd([[:silent! %s/\($\n\s*\)\+\%$//]])
  end
})

command('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

command('BufWritePre', {
  callback = function()
    vim.lsp.buf.format({ bufnr = bufnr })
  end
})

-- command("VimEnter", {
--   callback = function()
--     if vim.fn.argv(0) == "" then
--       require("telescope.builtin").find_files()
--     end
--   end
-- })
