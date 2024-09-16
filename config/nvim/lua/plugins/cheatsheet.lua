return {
    "sudormrfbin/cheatsheet.nvim",
    event = "InsertEnter",
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
        vim.keymap.set("n", "<leader>fh", "<cmd> Cheatsheet <cr> ", { desc = "Cheatsheet" })
    end
}
