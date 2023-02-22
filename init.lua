vim.g.mapleader = " "

function Set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require("plugins")
require("options")
require("keymaps")
require("autocmds")
