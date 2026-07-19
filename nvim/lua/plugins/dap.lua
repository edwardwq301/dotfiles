return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
    { "<F1>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<F2>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<F3>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    { "<F7>", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
  },
  config = function()
    require("mason-nvim-dap").setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = { "delve" },
    }

    local dapui = require "dapui"
    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    }

    require("dap-go").setup {
      delve = { detached = vim.fn.has "win32" == 0 },
    }

    local dap = require "dap"
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
