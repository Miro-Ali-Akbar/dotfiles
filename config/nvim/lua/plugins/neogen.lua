return {
    "danymat/neogen",
    keys = {
        { "<leader>lm", nil, desc = "Neogen annotation" },
    },
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
        vim.keymap.set("n", "<leader>lm", "<cmd> Neogen class <cr>", { desc = "Neogen annotation" })
    end,
}
