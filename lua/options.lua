vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

function Set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local options = {
  autoindent = true,
  backspace = { "indent", "eol", "start" },
  clipboard = "unnamedplus",
  colorcolumn = "120",
  completeopt = { "menu", "menuone", "noselect", "noinsert" },
  cursorline = true,
  encoding = "utf-8",
  fileencoding = "utf-8",
  foldenable = false,
  foldlevel = 20,
  foldmethod = "indent",
  ignorecase = true,
  incsearch = true,
  langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
  laststatus = 3,
  list = true,
  listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
  mouse = "a",
  nu = true,
  relativenumber = true,
  ruler = true,
  scrolloff = 15,
  shiftwidth = 2,
  showmode = false,
  signcolumn = "yes",
  smartindent = true,
  softtabstop = 2,
  swapfile = false,
  tabstop = 4,
  undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
  undofile = true,
  wildmenu = true,
}

vim.g.editorconfig = true

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
    set termguicolors
    lan en_US.UTF-8
]])
