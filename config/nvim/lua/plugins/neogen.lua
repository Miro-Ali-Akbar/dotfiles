return {
    "danymat/neogen",
    event = "BufEnter", -- TODO: make only start on sertain files
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
        vim.keymap.set("n", "<leader>lm", "<cmd> Neogen <cr>", { desc = "Neogen annotation" })
    end,
}
