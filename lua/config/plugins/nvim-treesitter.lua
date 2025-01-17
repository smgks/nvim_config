return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  config = function()
      require('nvim-treesitter.configs').setup({
          -- ignore_install = {"dart"},
          textobjects = {
              select = {
                  enable = true,
                  lookahead = true,
                  keymaps = {
                      ['af'] = '@function.outer',
                      ['if'] = '@function.inner',
                      ['ac'] = '@class.outer',
                      ['ic'] = '@class.inner',
                  },
                  selection_modes = {
                      ['@parameter.outer'] = 'v', -- charwise
                      ['@function.outer'] = 'V', -- linewise
                      ['@class.outer'] = '<c-v>', -- blockwise
                  },

              },
          },
          ensure_installed = {
              'bash',
              'c',
              'cpp',
              'css',
              'go',
              'gomod',
              "gowork",
              "gosum",
              'html',
              'python',
              'markdown',
              'yaml',
              'regex',
              'vim',
          },
          indent = {
            enable = true,
            disable = {
              "dart"
            },
          },
          incremental_selection = {
              enable = true,
              keymaps = {
                  init_selection = '<leader>ss',
                  node_incremental = '<leader>sn',
                  scope_incremental = '<leader>sS',
                  node_decremental = '<leader>sN',
              },
          },
          auto_install = true,
          highlight = {
              enable = true,
          },
      })
  end,
}
