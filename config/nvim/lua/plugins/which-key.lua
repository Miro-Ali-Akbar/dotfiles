return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")
        wk.add({
                { "<leader>c",  group = "Toggle" },
                { "<leader>ca", group = "Cellular Automaton" },
                { "<leader>f",  group = "Files" },
                { "<leader>l",  group = "LSP" },
                { "<leader>s",  group = "Search" },
                { "<leader>t",  group = "Terminal" },
            },
            { prefix = "<leader>" })
    end,
    opts = {

    }
}
