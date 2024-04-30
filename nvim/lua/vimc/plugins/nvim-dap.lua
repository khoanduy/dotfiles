return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim'
  },
  config = function (_, opts)
    local dap = require('dap')
    require('dapui').setup(opts)

    dap.listeners.after.event_initialized['dapui_config'] = function()
      require('dapui').open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      -- Commented to prevent DAP UI from closing when unit tests finish
      -- require('dapui').close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      -- Commented to prevent DAP UI from closing when unit tests finish
      -- require('dapui').close()
    end

    -- Add dap configurations based on your language/adapter settings
    dap.configurations.java = {
      {
        name = 'Debug Launch (2GB)';
        type = 'java';
        request = 'launch';
        vmArgs = '' ..
          '-Xmx2g '
      },
      {
        name = 'Debug Attach (5005)';
        type = 'java';
        request = 'attach';
        hostName = '127.0.0.1';
        port = 5005;
      },
    }
  end
}
