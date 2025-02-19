return {
    "tris203/precognition.nvim",
    event = "BufEnter",
    config = function()
        require("precognition").setup({})
        vim.keymap.set("n", "<leader>cp", "<cmd> Precognition toggle <cr>", { desc = "Precognition" })
    end,
}
