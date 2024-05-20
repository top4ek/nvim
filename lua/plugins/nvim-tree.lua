return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
      filters = {
        dotfiles = false
      },
      renderer = {
        group_empty = false
      },
      git = {
        ignore = false
      },
      auto_reload_on_write = true,
      create_in_closed_folder = false,
      disable_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      view = {
        width = 30,
        -- height = 30,
        side = "left",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes"
      }
    }
  end
}
