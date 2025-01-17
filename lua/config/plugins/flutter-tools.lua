return {
  'nvim-flutter/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MTDL9/vim-log-highlighting',
    "mfussenegger/nvim-dap",
  },
  lazy = false,
  config = function()
    require('flutter-tools').setup({
      flutter_path = "/Users/veto/development/flutter/bin/flutter",
      lsp = {
          color = {
              enabled = true,
              background = true,
              foreground = false,
          },
          on_attach = require("config.lsp_config").on_attach,
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = true,
        exception_breakpoints = {},
        evaluate_to_string_in_debug_views = true,
        register_configurations = function(paths)
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
              flutterSdkPath = "/Users/veto/development/flutter",
              cwd = "${workspaceFolder}",
            }
          }
        end,
      },
      dev_log = {
        enabled = true,
        filter = nil, -- optional callback to filter the log
        notify_errors = true, -- if there is an error whilst running then notify the user
        open_cmd = "15split", -- command to use to open the log buffer
      },
    })
    local map = vim.keymap.set
    require("telescope").load_extension("flutter")
    map("n", "<leader>fR", "<cmd>Telescope flutter commands<cr>")

  end,
}
