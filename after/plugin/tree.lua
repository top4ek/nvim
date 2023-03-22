local ok, tree = pcall(require, "nvim-tree")
if not ok then return end

tree.setup {
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
	  group_empty = true
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
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,
    signcolumn = "yes"
  }
}

Set_keymap('n', '<Leader>e', '<CMD>lua require("nvim-tree.api").tree.toggle { find_file = true, focus = false }<CR>')
