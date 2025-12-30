return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI Toggle [DAPUI] ",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate current expression [DAPUI] ",
      mode = { "n", "v" },
    },
  },
  config = function()
    local dap = require("dapui")
    -- local dapui = require("dapui")

    dap.setup()
  end
}
