return {
  "nvim-neorg/neorg",
  version = "*",
  lazy = false,
  keys = {
    { "<Leader>oj", "<cmd>Neorg journal today<CR>" },
    { "<Leader>oi", "<cmd>Neorg index<CR>" },
    { "<Leader>oo", "<cmd>Neorg<CR>" },
  },
  dependencies = {
    "luarocks.nvim",
  },
  config = function()
    local plugins = {
      ["core.defaults"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
          name = "[Norg]"
        }
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.concealer"] = {},
      -- ["core.export"] = {},
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
      -- ["core.presenter"] = {
      --   config = {
      --     zen_mode = "zen-mode"
      --   }
      -- },
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
    vim.opt.conceallevel = 2
    require("neorg").setup { load = plugins }
  end
}
