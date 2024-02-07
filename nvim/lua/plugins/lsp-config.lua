return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
        "williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",

        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",

        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    },
    config = function()
        require("neodev").setup()
        require("mason").setup()

        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        mason_lspconfig.setup_handlers({
            function(server)
                lspconfig[server].setup({})
            end,
        })
        mason_lspconfig.setup({
    		automatic_installation = true,
    	})

        vim.keymap.set("n",             "<leader>lk",   vim.lsp.buf.hover,          { desc = "Hover" })
        vim.keymap.set("n",             "<leader>ld",   vim.lsp.buf.definition,     { desc = "Defenition" })
        vim.keymap.set("n",             "<leader>lr",   vim.lsp.buf.references,     { desc = "References" })
        vim.keymap.set("n",             "<leader>ln",   vim.lsp.buf.rename,         { desc = "Rename" })
        vim.keymap.set({ "n", "v" },    "<leader>la",   vim.lsp.buf.code_action,    { desc = "Code action" })
        vim.keymap.set("n",             "<leader>lD",   vim.diagnostic.open_float,  { desc = "Diagnostic" })
        vim.keymap.set("n",             "<leader>lf",   function()
            vim.lsp.buf.format { async = true }
        end, { desc = "Format" })

        require("toggle_lsp_diagnostics").init()
        vim.keymap.set("n", "<leader>cl", "<cmd> ToggleDiag <cr>", { desc = "Lsp", silent = true })
    end
}
