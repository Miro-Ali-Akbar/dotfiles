return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover)--, { desc = "LSP hover" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)--, { desc = "LSP defenition" })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references)--, { desc = "LSP references" })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)--, { desc = "Rename" })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)--, { "" })
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format { async = true }
            end)--, { desc = "LSP format" })
        end
    }
}
