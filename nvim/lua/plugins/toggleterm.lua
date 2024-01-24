return {
    event = "VeryLazy",
    "akinsho/toggleterm.nvim",
    vim.keymap.set("n", "<leader>tf", "<cmd> ToggleTerm direction=float <cr>", { desc = "Floating terminal" }),
    vim.keymap.set("n", "<leader>tt", "<cmd> ToggleTerm <cr>", { desc = "Terminal" }),
    vim.keymap.set("t", "<Esc>", [[<Cmd> ToggleTerm <cr>]], { desc = "Toggle terminal" }),
    opts = {}

}
