return {
    "f-person/git-blame.nvim",
    config = function()
        vim.keymap.set('n', "<leader>cb", "<cmd> GitBlameToggle <cr>", { desc = "Toggle git blame" })
    end,
}
