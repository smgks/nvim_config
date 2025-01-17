return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    local gitsigns = require("gitsigns") 
    gitsigns.setup({
      signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
      auto_attach = true,
      attach_to_untracked = false,
    })
  vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
  vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
  end
}
