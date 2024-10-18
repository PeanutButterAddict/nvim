-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
  },
  config = function()
    -- local dapvscode = require 'dap.ext.vscode'
    -- dapvscode.load_launchjs('.vscode/launch.json', { codelldb = { 'c', 'cpp', 'rs' } })

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      -- automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
        'cpptools',
      },
    }

    local dap = require 'dap'
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = 'C:\\Users\\MiniBubblegum\\AppData\\Local\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd',
      options = {
        detached = false,
      },
    }
    dap.configurations.cpp = {

      {
        name = 'SweetReactions with engine remote debug',
        type = 'cppdbg',
        request = 'launch',
        program = 'C:\\godot\\godot\\bin\\godot.windows.editor.x86_64',
        args = {
          '--path',
          'C:\\godot\\sweet_reactions\\project',
          '-v',
          '--remote-debug',
          'tcp://127.0.0.1:6007',
          '--debug-collisions',
        },
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },

      {
        name = 'SweetReactions remote debug',
        type = 'cppdbg',
        request = 'launch',
        program = 'C:\\ProgramData\\chocolatey\\lib\\godot\\tools\\godot_v4.3-stable_win64.exe',
        args = {
          '--path',
          'C:\\godot\\sweet_reactions\\project',
          '--remote-debug',
          'tcp://127.0.0.1:6007',
          '--log-file',
        },
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },

      {
        name = 'SweetReactions with engine',
        type = 'cppdbg',
        request = 'launch',
        program = 'C:\\godot\\godot\\bin\\godot.windows.editor.x86_64',
        args = {
          '--path',
          'C:\\godot\\sweet_reactions\\project',
          '-v',
          '--log-file',
          'C:\\godot\\sweet_reactions\\logs\\gdb_engine_log.txt',
          '--debug-collisions',
        },
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },

      {

        name = 'SweetReactions',
        type = 'cppdbg',
        request = 'launch',
        program = 'C:\\ProgramData\\chocolatey\\lib\\godot\\tools\\godot_v4.3-stable_win64.exe',
        args = {
          '--path',
          'C:\\godot\\sweet_reactions\\project',
          '--log-file',
          'C:\\godot\\sweet_reactions\\logs\\gdb_log.txt',
          '--debug-collisions',
        },
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },

      {
        name = 'Launch file (pretty printing)',
        type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },

      {
        name = 'Attach to gdbserver :1234 (pretty printing)',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false,
          },
        },
      },
    }
    local dapui = require 'dapui'

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F1>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F8>', dap.disconnect, { desc = 'Debug: Disconnect' })

    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          -- pause = '⏸',
          -- play = '▶',
          -- step_into = '⏎',
          -- step_over = '⏭',
          -- step_out = '⏮',
          -- step_back = 'b',
          -- run_last = '▶▶',
          -- terminate = '⏹',
          -- disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    local widgets = require 'dap.ui.widgets'

    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', widgets.hover, { desc = 'Debug: Widget hover' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', widgets.preview, { desc = 'Debug: Widget preview' })

    -- vim.keymap.set('n', '<Leader>df', function()
    --   widgets.centered_float(widgets.frames)
    -- end, { desc = 'Debug: Widget centered_float frames' })
    -- vim.keymap.set('n', '<Leader>ds', function()
    --   widgets.centered_float(widgets.scopes)
    -- end, { desc = 'Debug: Widget centered_float scopes' })

    -- Install golang specific config
    -- require('dap-go').setup()
  end,
}
