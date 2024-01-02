return {
    event = "VeryLazy",
    "akinsho/toggleterm.nvim",
    vim.keymap.set('n', '<leader>tf', "<cmd>ToggleTerm direction=float<cr>"),--, {"Floating terminal"}),
    vim.keymap.set('n', '<leader>tt', "<cmd>ToggleTerm"),--, {"Terminal"}),
    vim.keymap.set('t', '<Esc>', [[<Cmd>ToggleTerm<cr>]]),--, {"Toggle terminal"}),
    opts = {}

}
