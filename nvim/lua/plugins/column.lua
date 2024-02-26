return {
    "ecthelionvi/NeoColumn.nvim",
    event = "BufEnter",
    config = function()
        require("NeoColumn").setup()
        vim.keymap.set("n", "<leader>cl", "<cmd>ToggleNeoColumn<cr>", { desc = "Column" })
    end,
}
