return {
  "mfussenegger/nvim-dap",
  dependencies   = {
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}, },   
  },
  config = function ()
    local dap   = require("dap")
    local dapui = require("dapui")
    
      require("dapui").setup()

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

    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    --vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', "<Leader>dc", dap.continue, {})

  end

}

-- HERE'S A LINK TO SOME DEBUGGER SETUP'S: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
