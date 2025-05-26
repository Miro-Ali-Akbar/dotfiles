return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    -- cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },-- TODO: fix so cmd actually works
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- "hrsh7th/cmp-nvim-lsp",
        "folke/lazydev.nvim",


        -- 'akinsho/flutter-tools.nvim', -- flutter
    },
    config = function()
        -- require("flutter-tools").setup() -- flutter
        require("lazydev").setup()
        require("mason").setup()

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "clangd", "ts_ls", "bashls", "pyright" },
            automatic_installation = true,
        })

        vim.diagnostic.config({ virtual_text = true, })

        function Lsp_toggle_diagnostic()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end

        function Lsp_format()
            vim.lsp.buf.format { async = true }
        end

        vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Defenition" })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
        vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Diagnostic" })
        vim.keymap.set("n", "<leader>lf", "<cmd>lua Lsp_format()<cr>", { desc = "Format", noremap = true, })
        vim.keymap.set('n', '<leader>cl', "<cmd>lua Lsp_toggle_diagnostic()<cr>", { desc = "Lsp diagnostics" })
    end
}
