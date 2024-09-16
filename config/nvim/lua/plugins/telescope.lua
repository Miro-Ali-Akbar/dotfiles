return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "Files" })
        vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep  <cr>", { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags  <cr>", { desc = "Help tags" })

        -- "nvim-telescope/telescope-ui-select.nvim",
        require("telescope").setup({
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {}
            }
        })
        require("telescope").load_extension("ui-select")
    end
}
