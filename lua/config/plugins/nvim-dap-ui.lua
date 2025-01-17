return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    { "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
    { "<leader>de", "<cmd>lua require('dapui').eval()<cr>", desc = "Evaluate DAP UI" },
    { "<leader>dr", "<cmd>lua require('dapui').repl.toggle()<cr>", desc = "Toggle DAP UI REPL" },

    { "<leader>ds", "<cmd>lua require('dap').step_over()<cr>", desc = "Step Over" },
    { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require('dap').step_out()<cr>", desc = "Step Out" },
    { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", desc = "Set Breakpoint" },
    { "<leader>dl", "<cmd>lua require('dap').list_breakpoints()<cr>", desc = "List Breakpoints" },
    { "<leader>du", "<cmd>lua require('dap').up()<cr>", desc = "Up" },
    { "<leader>dd", "<cmd>lua require('dap').down()<cr>", desc = "Down" },
  },
  config = function()
    require("dapui").setup()
  end,
}
