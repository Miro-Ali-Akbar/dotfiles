return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>fg", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>fG", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>fb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame" })
        vim.keymap.set("n", "<leader>fB", "<cmd>Gitsigns blame<cr>", { desc = "Blame history" })
    end
}
