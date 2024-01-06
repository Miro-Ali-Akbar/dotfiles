return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 0--300
        require("which-key").register({}, {})
    end,
    opts = {

    }
}
