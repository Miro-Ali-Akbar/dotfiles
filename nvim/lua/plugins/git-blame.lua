return {
    "f-person/git-blame.nvim",
	event = "CursorMoved",
    config = function()
        vim.keymap.set("n", "<leader>cb", "<cmd> GitBlameToggle <cr>", { desc = "Git blame" })
    end,
}
