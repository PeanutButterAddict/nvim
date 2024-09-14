-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  { 'nvim-neotest/nvim-nio' },

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
          require('harpoon'):list():add()
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

  {
    'Badhi/nvim-treesitter-cpp-tools',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    -- Optional: Configuration
    opts = function()
      local options = {
        preview = {
          quit = 'q', -- optional keymapping for quit preview
          accept = '<tab>', -- optional keymapping for accept preview
        },
        header_extension = 'h', -- optional
        source_extension = 'cpp', -- optional
        custom_define_class_function_commands = { -- optional
          TSCppImplWrite = {
            output_handle = require('nt-cpp-tools.output_handlers').get_add_to_cpp(),
          },
          --[[
                <your impl function custom command name> = {
                    output_handle = function (str, context)
                        -- string contains the class implementation
                        -- do whatever you want to do with it
                    end
                }
                ]]
        },
      }
      return options
    end,
    -- End configuration
    config = true,
  },

  {
    'kr40/nvim-macros',
    cmd = { 'MacroSave', 'MacroYank', 'MacroSelect', 'MacroDelete' },
    opts = {

      json_file_path = vim.fs.normalize(vim.fn.stdpath 'config' .. '/macros.json'), -- Location where the macros will be stored
      default_macro_register = 'a', -- Use as default register for :MacroYank and :MacroSave and :MacroSelect Raw functions
      json_formatter = 'none', -- can be "none" | "jq" | "yq" used to pretty print the json file (jq or yq must be installed!)
    },
    keys = {
      {
        '<leader>ms',
        '<cmd>MacroSave<CR>',
        desc = 'MacroSave',
      },

      {
        '<leader>my',
        '<cmd>MacroYank<CR>',
        desc = 'MacroYank',
      },

      {
        '<leader>mm',
        '<cmd>MacroSelect<CR>',
        desc = 'MacroSelect',
      },

      {
        '<leader>md',
        '<cmd>MacroDelete<CR>',
        desc = 'MacroDelete',
      },
    },
  },

  -- {
  --   'folke/trouble.nvim',
  --   opts = {}, -- for default options, refer to the configuration section for custom setup.
  --   cmd = 'Trouble',
  --   keys = {
  --     {
  --       '<leader>xx',
  --       '<cmd>Trouble diagnostics toggle<cr>',
  --       desc = 'Diagnostics (Trouble)',
  --     },
  --
  --     {
  --       '<leader>xX',
  --       '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  --       desc = 'Buffer Diagnostics (Trouble)',
  --     },
  --
  --     {
  --       '<leader>cs',
  --       '<cmd>Trouble symbols toggle focus=false<cr>',
  --       desc = 'Symbols (Trouble)',
  --     },
  --
  --     {
  --       '<leader>cl',
  --       '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  --       desc = 'LSP Definitions / references / ... (Trouble)',
  --     },
  --
  --     {
  --       '<leader>xL',
  --       '<cmd>Trouble loclist toggle<cr>',
  --       desc = 'Location List (Trouble)',
  --     },
  --
  --     {
  --       '<leader>xQ',
  --       '<cmd>Trouble qflist toggle<cr>',
  --       desc = 'Quickfix List (Trouble)',
  --     },
  --   },
  -- },

  -- {
  --   'nvim-treesitter/playground',
  --   event = 'VeryLazy',
  --   cmd = { 'TSPlaygroundToggle' },
  --   keys = {
  --     { '<leader><leader>t', '<cmd> TSPlaygroundToggle <CR>', desc = 'Toggle TSPlayground' },
  --   },
  -- },
}
