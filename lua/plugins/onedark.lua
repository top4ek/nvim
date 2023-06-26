return { 'navarasu/onedark.nvim',
  config = function()
    local onedark = require("onedark")
    onedark.setup {
      style = "light",
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      toggle_style_key = "<leader>ts",
      toggle_style_list = { "light", "dark" },

      -- code_style = {
      --     comments = 'italic',
      --     keywords = 'none',
      --     functions = 'none',
      --     strings = 'none',
      --     variables = 'none'
      -- },

      colors = {
        blue = '#181fba'
      },

      diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
      },
    }
    onedark.load()

    if os.getenv("LIGHT_TERMINAL") == 'True' then
      vim.o.background = 'light'
    else
      vim.o.background = 'dark'
    end
  end
}
