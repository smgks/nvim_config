local _setupLazy = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    require("lazy").setup({
        spec = {
            { import = "config.lazy" },
        },
        install = { colorscheme = { "habamax" } },
        checker = { enabled = true },
    })
end

return function ()
    vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

    vim.g.mapleader = " "

		vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2

    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true

    vim.opt.clipboard = "unnamedplus"
    vim.opt.scrolloff = 999

    vim.opt.virtualedit = "block"

    vim.opt.inccommand = "split"

    vim.opt.termguicolors = true

    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    vim.o.foldenable = false

    vim.opt.tabstop = 2
    vim.opt.wrap = true
    vim.o.exrc = true
    vim.o.secure = true

    _setupLazy()
end
