return {
    event = "VeryLazy",
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            mappings = { basic = true, extra = true },
        })
        vim.keymap.set("x", "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment"})
    end,
}
