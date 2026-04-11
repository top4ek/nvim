vim.pack.add({
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/mfussenegger/nvim-dap"
})

vim.keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<leader>dC", function() require("dap").run_to_cursor() end)
vim.keymap.set("n", "<leader>dg", function() require("dap").goto_() end)
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end)
vim.keymap.set("n", "<leader>dj", function() require("dap").down() end)
vim.keymap.set("n", "<leader>dk", function() require("dap").up() end)
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end)
vim.keymap.set("n", "<leader>do", function() require("dap").step_out() end)
vim.keymap.set("n", "<leader>dO", function() require("dap").step_over() end)
vim.keymap.set("n", "<leader>dp", function() require("dap").pause() end)
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end)
vim.keymap.set("n", "<leader>ds", function() require("dap").session() end)
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end)
vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end)
vim.keymap.set("n", "<leader>du", function() require("dap").toggle({}) end)
vim.keymap.set("n", "<leader>de", function() require("dap").eval() end)

require("dap").adapters.go = {
  type = "server",
  host = "127.0.0.1",
  port = 40000,
}

require("dapui").setup()
