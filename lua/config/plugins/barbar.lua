return {
  'romgrk/barbar.nvim',
  dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
       animation = false,
       clickable = true,
       sidebar_filetypes = {
           -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
           NvimTree = true,
           -- Or, specify the text used for the offset:
           undotree = {
               text = 'undotree',
               align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
           },
           -- Or, specify the event which the sidebar executes when leaving:
           ['neo-tree'] = {event = 'BufWipeout'},
           -- Or, specify all three
           Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
       },
   },
  version = '^1.0.0',
  config = function()
      require('barbar').setup({
          animation = false,
          clickable = true,
          sidebar_filetypes = {
              -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
              NvimTree = true,
              -- Or, specify the text used for the offset:
              undotree = {
                  text = 'undotree',
                  align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
              },
              -- Or, specify the event which the sidebar executes when leaving:
              ['neo-tree'] = {event = 'BufWipeout'},
              -- Or, specify all three
              Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
          }
      })
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'apprentice', -- after apprentice loads specifically
        callback = function()
          vim.api.nvim_set_hl(0,
            'BufferCurrent', -- or any other hl group
            { --[[ the definition of the group here ]] }
          )

          -- vim.api.nvim_set_hl(…)
        end,
      })
      local map = vim.keymap.set
      map('n', '<tab>', '<cmd>BufferNext<cr>', { noremap = true, silent = true })
      map('n', '<s-tab>', '<cmd>BufferPrevious<cr>', { noremap = true, silent = true })
      map('n', '<leader>x', '<cmd>BufferClose<cr>', { noremap = true, silent = true })
  end
}
