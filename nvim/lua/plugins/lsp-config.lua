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
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server)
                    lspconfig[server].setup({})
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
            "folke/neodev.nvim",
        },
        lazy = false,
        config = function()
            require("neodev").setup({})
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})

            vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "LSP hover" })
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP defenition" })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP references" })
            vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "LSP rename" })
            vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
            vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "LSP diagnostic" })
            vim.keymap.set("n", "<leader>lf", function()
                vim.lsp.buf.format { async = true }
            end, { desc = "LSP format" })

            require("toggle_lsp_diagnostics").init()
            vim.keymap.set("n", "<leader>cl", "<cmd> ToggleDiag <cr>", { desc = "Toggle lsp", silent = true })
        end
    }
}
