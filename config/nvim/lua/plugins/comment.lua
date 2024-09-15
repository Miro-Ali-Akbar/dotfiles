return {
    event = "BufEnter",
    "numToStr/Comment.nvim",
    -- cmd = { TODO: add }
    config = function()
        require("Comment").setup({
            mappings = { basic = false, extra = false },
        })
        vim.keymap.set({ "x", "v" }, "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment"})
        vim.keymap.set("n", "<leader>cc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment" })
    end,
}
