return {
    "danymat/neogen",
    keys = {
        { "<leader>lm", nil, desc = "Neogen annotation" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip"
    },
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
        vim.keymap.set("n", "<leader>lm", "<cmd> Neogen <cr>", { desc = "Neogen annotation" })
    end,
}
