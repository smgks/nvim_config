return {
  "nvim-telescope/telescope.nvim",
  keys = {
      {"<leader>ff", "<cmd> Telescope find_files<cr>", desc = "Find Files"},
      {"<leader>fg", "<cmd> Telescope live_grep<cr>", desc = "Live Grep"},
      {"<leader>fd", "<cmd>Telescope diagnostics<CR>", desc="Telescope diagnostics"},

      {"<leader>fr", "<cmd> Telescope lsp_references<cr>", desc = "References"},
      {"<leader>fA", "<cmd> Telescope lsp_code_actions<cr>", desc = "Code Actions"},
  }
}
