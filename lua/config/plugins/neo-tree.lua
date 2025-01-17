return {
  "nvim-neo-tree/neo-tree.nvim",

  branch = "v3.x",
  dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
              {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
              {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
              {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
              {text = "󰌵", texthl = "DiagnosticSignHint"})

      require("neo-tree").setup({
          close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
          sort_case_insensitive = false, -- used when sorting files and directories in the tree
          sort_function = nil , -- use a custom function for sorting files and directories in the tree

          default_component_configs = {
              container = {
                  enable_character_fade = true
              },
              indent = {
                  indent_size = 2,
                  padding = 1,
                  with_markers = true,
                  indent_marker = "│",
                  last_indent_marker = "└",
                  highlight = "NeoTreeIndentMarker",
                  with_expanders = nil,
                  expander_collapsed = "",
                  expander_expanded = "",
                  expander_highlight = "NeoTreeExpander",
              },
              icon = {
                  folder_closed = "",
                  folder_open = "",
                  folder_empty = "",
                  default = "*",
                  highlight = "NeoTreeFileIcon"
              },
              modified = {
                  symbol = "[+]",
                  highlight = "NeoTreeModified",
              },
              name = {
                  trailing_slash = false,
                  use_git_status_colors = true,
                  highlight = "NeoTreeFileName",
              },
              git_status = {
                  symbols = {
                      unstaged = "󰄱",
                      staged = "󰱒",
                  },
              },
          },
      })

      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
      local map = vim.keymap.set
      map('n', '<leader>E', '<cmd>Neotree toggle<cr>', { noremap = true, silent = true })
      map('n', '<leader>e', '<cmd>Neotree focus<cr>', { noremap = true, silent = true })
      map('n', '<leader>gs', '<cmd>Neotree float git_status<cr>', { noremap = true, silent = true })
  end
}
