return {
    require('config.plugins.barbar'),
    require('config.plugins.cmake-tools'),
    require('config.plugins.flutter-tools'),
    require('config.plugins.github-nvim-theme'),
    require('config.plugins.lua-snip'),
    require('config.plugins.null-ls'),
    require('config.plugins.nvim-lspconfig'),
    require('config.plugins.nvim-treesitter-textobjects'),
    require('config.plugins.nvim-treesitter'),
    require('config.plugins.telescope'),
    require('config.plugins.transparent'),
    require('config.plugins.trouble'),
    require('config.plugins.nvim-dap'),
    require('config.plugins.lualine'),
    require('config.plugins.gitsigns'),
    require('config.plugins.vim-fugitive'),
    require('config.plugins.neogit'),
    require('config.plugins.nvim-dap-ui'),
    require('config.plugins.markdown-preview'),
    require('config.plugins.neo-tree'),

    -- {
    --     "zbirenbaum/copilot.lua",
    --     config = function()
    --         require("copilot").setup()
    --     end
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function ()
    --         require("copilot_cmp").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end
    -- },
}
