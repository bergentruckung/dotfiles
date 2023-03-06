local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

local dap = require('dap')
dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.rust
