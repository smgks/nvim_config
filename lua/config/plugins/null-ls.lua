return {
  'jose-elias-alvarez/null-ls.nvim',
  ft = 'go',
  opts = function ()
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    return {
      sources = null_ls.builtins.formatting.gofmt,
      on_attach = function (client, bufnr)
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function ()
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        })
      end
    }
  end
}
