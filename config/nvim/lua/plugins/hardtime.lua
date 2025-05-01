return {
    {
        enabled = true,
        "tris203/precognition.nvim",
        event = "BufEnter",
        config = function()
            require("precognition").setup({})
            vim.keymap.set("n", "<leader>cp", "<cmd> Precognition toggle <cr>", { desc = "Precognition" })
        end,

    },
    {
        "m4xshen/hardtime.nvim",
        event = "BufEnter",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("hardtime").setup({
                disable_mouse = false,
            })
            -- TODO: Does not work for some reason
            vim.keymap.set("n", "<leader>ch", "<cmd> Hardtime toggle <cr>", { desc = "Hardtime" })
        end,
    }
}
