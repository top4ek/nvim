vim.pack.add({
  "https://github.com/vhyrro/luarocks.nvim",
  "https://github.com/nvim-neorg/neorg"
})

vim.keymap.set("n", "<Leader>oj", "<cmd>Neorg journal today<CR>")
vim.keymap.set("n", "<Leader>oi", "<cmd>Neorg index<CR>")
vim.keymap.set("n", "<Leader>oo", "<cmd>Neorg<CR>")

require("luarocks-nvim").setup()
require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.integrations.treesitter"] = {
      config = {
        configure_parsers = false,
        install_parsers = false,
      },
    },
    -- ["core.completion"] = {
    --   config = {
    --     engine = "nvim-cmp",
    --     name = "[Norg]"
    --   }
    -- },
    ["core.concealer"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader><Leader>",
      },
    },
    ["core.esupports.metagen"] = {
      config = {
        type = "auto",
        update_date = true
      }
    },
    ["core.journal"] = {
      config = {
        strategy = "nested",
        workspace = "Default",
      },
    },
    -- ["core.summary"] = {},
    ["core.dirman"] = {
      config = {
        index = "index.norg",
        open_last_workspace = true,
        workspaces = {
          Default = os.getenv("NORG_DEFAULT") or "~/Syncthing/configs/neorg"
        }
      }
    },
  }
})

vim.opt.conceallevel = 2
