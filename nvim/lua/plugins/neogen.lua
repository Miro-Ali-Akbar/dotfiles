return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
        vim.keymap.set("n", "<leader>lm", "<cmd> Neogen <cr>", { desc = "Neogen annotation" })
    end,
}
