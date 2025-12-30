return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition [DAP]" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint [DAP]" },
    { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue [DAP]" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor [DAP]" },
    { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to line (no execute) [DAP]" },
    { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into [DAP]" },
    { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down [DAP]" },
    { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up [DAP]" },
    { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last [DAP]" },
    { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out [DAP]" },
    { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over [DAP]" },
    { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause [DAP]" },
    { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL [DAP]" },
    { "<leader>ds", function() require("dap").session() end,                                              desc = "Session [DAP]" },
    { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate [DAP]" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets [DAP]" },
  },
  config = function()
    require("dap").adapters.go = {
      type = "server",
      host = "127.0.0.1",
      port = 40000,
    }
  end
}
