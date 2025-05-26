return {
    "tzachar/local-highlight.nvim",
    config = function()
        require('local-highlight').setup({
            vim.keymap.set("n", "<leader>ch", "<cmd>LocalHighlightToggle<cr>", { desc = "Highlight current word" })
        })
    end
}
