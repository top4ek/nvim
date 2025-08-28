Set_keymap("n", "<Leader>q", "", {
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
Set_keymap("n", "<Leader>Q", "<cmd>%bd<CR>")

Set_keymap("v", "J", ":m '>+1<CR>gv=gv")
Set_keymap("v", "K", ":m '<-2<CR>gv=gv")

Set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

Set_keymap("i", "jk", "<ESC>")
Set_keymap("i", "jkl", "<ESC><cmd>write<CR>")
Set_keymap("", "<Leader>bb", "obinding.pry<ESC>")
Set_keymap("", "<Leader>bB", "Obinding.pry<ESC>")

Set_keymap("n", "<Leader>fs", "<cmd>Neogit<CR>")
Set_keymap("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.code_action()<CR>")

Set_keymap('n', '<Leader>e', '<CMD>lua require("nvim-tree.api").tree.toggle { find_file = true, focus = false }<CR>')

Set_keymap("v", "<leader>s", "<cmd>sort i<cr>")

Set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
Set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
