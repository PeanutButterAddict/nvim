-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
{ "nvim-neotest/nvim-nio" },

  {
    'nvim-treesitter/playground',
    event = 'VeryLazy',
    cmd = { 'TSPlaygroundToggle' },
    keys = {
      { '<leader><leader>t', '<cmd> TSPlaygroundToggle <CR>', desc = 'Toggle TSPlayground' },
    },
  },

  {
    'mbbill/undotree',
    event = 'VeryLazy',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle Undotree' },
    },
  },

  {
    'ThePrimeagen/harpoon',
    -- event = 'VeryLazy',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon'):setup()
    end,
    keys = {
      {
        '<leader>a',
        function()
          require('harpoon'):list():append()
        end,
        desc = 'mark file through harpoon',
      },

      {
        '<C-e>',
        function()
          require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
        end,
        desc = 'toggle harpoon menu',
      },

      {
        '<A-1>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'harpoon file 1',
      },

      {
        '<A-2>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'harpoon file 2',
      },

      {
        '<A-3>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'harpoon file 3',
      },

      {
        '<A-4>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'harpoon file 4',
      },

      {
        '<A-5>',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'harpoon file 5',
      },

      {
        '<A-6>',
        function()
          require('harpoon'):list():select(6)
        end,
        desc = 'harpoon file 6',
      },

      {
        '<A-S-P>',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'harpoon prev file',
      },

      {
        '<A-S-N>',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'harpoon next file',
      },
    },
  },

  -- {
  --   'rcarriga/nvim-dap-ui',
  --   event = 'VeryLazy',
  --   dependencies = 'mfussenegger/nvim-dap',
  --   config = function()
  --     local dap = require 'dap'
  --     local dapui = require 'dapui'
  --     dapui.setup()
  --     dap.listeners.after.event_initialized['dapui_config'] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated['dapui_config'] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited['dapui_config'] = function()
  --       dapui.close()
  --     end
  --   end,
  --   keys = {
  --     { '<leader>db', '<cmd> DapToggleBreakpoint <CR>', desc = 'Add breakpoint at line' },
  --     { '<leader>dr', '<cmd> DapContinue <CR>', desc = 'Start debugger' },
  --   },
  -- },
  --
  -- {
  --   'jay-babu/mason-nvim-dap.nvim',
  --   event = 'VeryLazy',
  --   dependencies = {
  --     'williamboman/mason.nvim',
  --     'mfussenegger/nvim-dap',
  --   },
  --   opts = {
  --     handlers = {},
  --   },
  -- },
  --
  -- {
  --   'mfussenegger/nvim-dap',
  --   config = function(_, _)
  --     local dapvscode = require 'dap.ext.vscode'
  --     dapvscode.load_launchjs('.vscode/launch.json', { codelldb = { 'c', 'cpp' } })
  --   end,
  -- },
}
