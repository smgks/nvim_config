local M = {}

M.init_keymaps = function(bufnr)
    local opts = { noremap=true, silent=true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap

    buf_set_keymap(bufnr,"n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

    buf_set_keymap(bufnr, "n", 'gD', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
    buf_set_keymap(bufnr,"n", "<leader>ra", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(bufnr,"n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

M.on_attach = function(_, bufnr)
    vim.api.nvim_command('b ' .. bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


    M.init_keymaps(bufnr)
end

M.on_init = function(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()


M.setup = function()
    local luasnip = require 'luasnip'
    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"
    local cmp = require 'cmp'

    cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
    end)

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sorting = {
            priority_weight = 2,
            comparators = {
                -- require("copilot_cmp.comparators").prioritize,

                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.locality,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        sources = cmp.config.sources({
            -- { name = "copilot", group_index = 2 },
            -- Other Sources
            { name = "nvim_lsp", group_index = 2 },
            { name = "path", group_index = 2 },
            { name = "luasnip", group_index = 2 },
        }),
    }
    lspconfig.lua_ls.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        on_init = M.on_init,

        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        vim.fn.expand "$VIMRUNTIME/lua",
                        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                        "${3rd}/luv/library",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    }

    lspconfig.clangd.setup({
      cmd = { "/usr/bin/clangd" },
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })

    local dartExcludedFolders = {
			vim.fn.expand("$HOME/.pub-cache"),
			vim.fn.expand("/opt/homebrew/"),
			vim.fn.expand("$HOME/tools/flutter/"),
		}

    lspconfig.gopls.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = {"gopls"},
        filetypes = {
            "go", "gomod", "gowork", "gotmpl",
        },
        root_dir = util.root_pattern("go_work", "go.mod", ".git"),
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            }
        }
    }

    lspconfig.cmake.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        filetypes = {
            "cmake",
        },
        root_dir = lspconfig.util.root_pattern('CMakeLists.txt', '.git'),
    }
end

return M
