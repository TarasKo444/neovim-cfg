function CDap()
  local dap = require("dap")
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      args = { "--port", "${port}" },
    },
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      MIMode = "lldb"
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      CDap()

      local dap = require('dap')
      vim.keymap.set('n', '<Down>', function() dap.step_over() end, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<Right>', function() dap.step_into() end, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<Left>', function() dap.step_out() end, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<Up>', function() dap.restart_frame() end, { desc = 'Debug: Restart Frame' })
      vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<leader>dq', function() dap.terminate() end, { desc = 'Debug: Terminate' })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    },
    config = function ()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<leader>dk', function() require("dapui").eval() end, { desc = 'Debug: Hover Value' })
    end
  }
}
