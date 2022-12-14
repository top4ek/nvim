local options = {
    autoindent = true,
    backspace = { "indent", "eol", "start" },
    clipboard = "unnamedplus",
    colorcolumn = "120",
    completeopt = { "menu", "menuone", "noselect", "noinsert" },
    cursorline = true,
    encoding = "utf-8",
    foldenable = true,
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
    shiftwidth = 4,
    signcolumn = "yes",
    smartindent = true,
    softtabstop = 4,
    swapfile = false,
    tabstop = 4,
    undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
    undofile = true,
    wildmenu = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd([[
    set termguicolors
    lan en_US.UTF-8
]])
