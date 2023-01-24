vim.g.mapleader = " "

function Set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

Set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
Set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
Set_keymap("n", "<Leader>Q", "<cmd>bufdo bd<CR>")
Set_keymap("n", "<Leader>qa", "<cmd>qall<CR>")
