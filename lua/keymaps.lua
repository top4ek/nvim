vim.g.mapleader = " "

function Set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

Set_keymap("n", "<Leader>q", "",  {
  callback = function()
    local buflisted = vim.fn.getbufinfo({buflisted = 1})
    local cur_winnr, cur_bufnr = vim.fn.winnr(), vim.fn.bufnr()
    if #buflisted < 2 then cmd 'confirm qall' return end
    for _, winid in ipairs(vim.fn.getbufinfo(cur_bufnr)[1].windows) do
      vim.cmd(string.format('%d wincmd w', vim.fn.win_id2win(winid)))
      vim.cmd(cur_bufnr == buflisted[#buflisted].bufnr and 'bp' or 'bn')
    end
    vim.cmd(string.format('%d wincmd w', cur_winnr))
    local is_terminal = vim.fn.getbufvar(cur_bufnr, '&buftype') == 'terminal'
    vim.cmd(is_terminal and 'bd! #' or 'silent! confirm bd #')
  end
})

Set_keymap("", "<Left>", ':echoe "Use h"<CR>')
Set_keymap("", "<Right>", ':echoe "Use l"<CR>')
Set_keymap("", "<Up>", ':echoe "Use k"<CR>')
Set_keymap("", "<Down>", ':echoe "Use j"<CR>')

Set_keymap("v", "J", ":m '>+1<CR>gv=gv")
Set_keymap("v", "K", ":m '<-2<CR>gv=gv")

Set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

Set_keymap("i", "jj", "<ESC>")
Set_keymap("", "<Leader>bb", "obinding.break<ESC>")
Set_keymap("", "<Leader>bB", "Obinding.break<ESC>")

Set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
Set_keymap("n", "<Leader>fp", "<cmd>Telescope projects<CR>")
Set_keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
Set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
Set_keymap("n", "<Leader>fs", "<cmd>Telescope git_status<CR>")
Set_keymap("n", "<Leader>fd", "<cmd>Telescope diagnostics<CR>")
Set_keymap("n", "<Leader>fu", "<cmd>Telescope undo<CR>")
Set_keymap("n", "<Leader>fr", "<cmd>Telescope registers<CR>")
Set_keymap("n", "<Leader>fa", "<cmd>Telescope aerial<CR>")

Set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
Set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
Set_keymap("n", "<Leader>Q", "<cmd>bufdo bd<CR>")
