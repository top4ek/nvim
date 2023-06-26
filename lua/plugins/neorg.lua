return { "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  build = ":Neorg sync-parsers",
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
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond"
        }
      },
      ["core.export"] = {},
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
      ["core.qol.toc"] = {},
      ["core.qol.todo_items"] = {},
      ["core.looking-glass"] = {},
      ["core.presenter"] = {
        config = {
          zen_mode = "zen-mode"
        }
      },
      ["core.journal"] = {
        config = {
          strategy = "flat",
          workspace = "Default",
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            Default = "~/Syncthing/configs/neorg"
          }
        }
      },
    }
    require("neorg").setup { load = plugins }
  end
}
