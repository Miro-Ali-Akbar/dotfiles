return {
    "ecthelionvi/NeoColumn.nvim",
    event = "InsertEnter",
    config = function()
        require("NeoColumn").setup()
        vim.keymap.set("n", "<leader>co", "<cmd>ToggleNeoColumn<cr>", { desc = "Column" })
    end,
}
