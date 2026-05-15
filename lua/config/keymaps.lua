vim.keymap.set("n", "<Leader>q", "", {
  callback = function()
    local buflisted = vim.fn.getbufinfo({ buflisted = 1 })
    local cur_winnr, cur_bufnr = vim.fn.winnr(), vim.fn.bufnr()
    -- if #buflisted < 2 then vim.cmd 'confirm qall' return end
    for _, winid in ipairs(vim.fn.getbufinfo(cur_bufnr)[1].windows) do
      vim.cmd(string.format('%d wincmd w', vim.fn.win_id2win(winid)))
      vim.cmd(cur_bufnr == buflisted[#buflisted].bufnr and 'bp' or 'bn')
    end
    vim.cmd(string.format('%d wincmd w', cur_winnr))
    local is_terminal = vim.fn.getbufvar(cur_bufnr, '&buftype') == 'terminal'
    vim.cmd(is_terminal and 'bd! #' or 'silent! confirm bd #')
  end
})
vim.keymap.set("n", "<Leader>Q", "<cmd>%bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "jkl", "<ESC><cmd>write<CR>")
vim.keymap.set("", "<Leader>bb", "obinding.pry<ESC>")
vim.keymap.set("", "<Leader>bB", "Obinding.pry<ESC>")

vim.keymap.set("n", "<Leader>fs", "<cmd>Neogit<CR>")
vim.keymap.set("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("v", "<leader>s", "<cmd>sort i<cr>")

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>")
