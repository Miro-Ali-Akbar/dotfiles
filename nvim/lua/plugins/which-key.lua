return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").register({}, {})

        local wk = require("which-key")
        wk.register({
                l = { name = "LSP" },
                c = { name = "Toggle" },
                f = { name = "Files" },
                s = { name = "Search" },
                t = { name = "Terminal" },
            },
            { prefix = "<leader>" })
    end,
    opts = {

    }
}
