return {
    -- event = "BufEnter",
    "numToStr/Comment.nvim",
    keys = {
        { "<leader>cc", nil, mode = { "x", "v", "n" }, desc = "Comment" }
    },
    config = function()
        require("Comment").setup({
            -- @diagnostic disable-next-line
            mappings = { basic = false, extra = false },
        })
        vim.keymap.set({ "x", "v" }, "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment" })
        vim.keymap.set("n", "<leader>cc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment" })
    end,
}
