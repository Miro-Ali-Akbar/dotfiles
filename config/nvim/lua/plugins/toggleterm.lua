return {
    cmd = { "ToggleTerm" },
    "akinsho/toggleterm.nvim",
    vim.keymap.set("n", "<leader>tf", "<cmd> ToggleTerm direction=float <cr>", { desc = "Floating" }),
    vim.keymap.set("n", "<leader>tt", "<cmd> ToggleTerm <cr>", { desc = "Normal" }),
    vim.keymap.set("t", "<Esc>", [[<Cmd> ToggleTerm <cr>]], { desc = "Toggle terminal" }),
    opts = {}

}
