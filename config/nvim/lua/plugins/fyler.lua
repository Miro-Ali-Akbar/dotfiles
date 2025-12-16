return {
    -- enabled = false;
    "A7Lavinraj/fyler.nvim",
    lazy = false,
    branch = "stable",
    config = function()
        require("fyler").setup({
            integrations = {
                icon = "none",
                -- winpick = "snacks",
                -- opts = {
                --
                -- }
            },
            viewes = {
                win = {
                    border = "none"
                },
                finder = {
                    confirm_simple = true,
                    delete_to_trash = true,
                },
            },
        })
        vim.keymap.set("n", "<leader>e", "<cmd>Fyler kind=float<cr>", { desc = "Fyler" })
    end,
}
