return { "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter" },
  config = function ()
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
            Default = "~/Syncthing/configs/neorg"
          }
        }
      },
    }
    -- vim.opt.conceallevel = 2
    require("neorg").setup { load = plugins }
  end
}
