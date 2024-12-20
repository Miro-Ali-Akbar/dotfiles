return {
    "sudormrfbin/cheatsheet.nvim",
    keys = {
        { "<leader>fH", nil, desc = "Cheatsheet" }
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("cheatsheet").setup({
            bundled_cheatsheets = {
                disabled = { "nerd-fonts" },
            },
        })
        vim.keymap.set("n", "<leader>fH", "<cmd> Cheatsheet <cr> ", { desc = "Cheatsheet" })
    end
}
