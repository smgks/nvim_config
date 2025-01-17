return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      servers = {
        neocmake = {},
      },
    },
    config = function()
        local lspconf = require("config.lsp_config")
        lspconf.setup()
    end
}
