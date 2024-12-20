return {

    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "HiPhish/rainbow-delimiters.nvim",
    },
    ---@type snacks.Config
    opts = {
        quickfile = {},
        terminal = {
            enabled = false
        },
        bufdelete = {
            vim.keymap.set("n", "<Tab>c", "<cmd> lua Snacks.bufdelete.delete() <cr>", { desc = "Buffer close" })
        },
        indent = {
            indent = {},
            scope = {
                enabled = true,
                only_current = true,
                hl = {
                    -- Match rainbow delimiters
                    "RainbowDelimiterRed",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterViolet",
                },
            },
        },
    },
}
