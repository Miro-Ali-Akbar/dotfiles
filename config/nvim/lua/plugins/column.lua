return {
    "ecthelionvi/NeoColumn.nvim",
    event = "InsertEnter",
    config = function()
        require("NeoColumn").setup()
        vim.cmd("ToggleNeoColumn")
        vim.keymap.set("n", "<leader>co", "<cmd>ToggleNeoColumn<cr>", { desc = "Column" })
    end,
}
