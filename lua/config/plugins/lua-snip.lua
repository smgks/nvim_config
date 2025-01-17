return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        {
            'hrsh7th/cmp-nvim-lsp',
        },
        {
            'saadparwaiz1/cmp_luasnip',
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
            },
            opts = function(_, opts)
                opts = opts or {}
                opts.sources = opts.sources or {}
                opts.snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                }
                table.insert(opts.sources, { name = "luasnip" })
            end,
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require("luasnip").session.jump_active
                then
                    require("luasnip").unlink_current()
                end
            end,
        })
    end,
}
