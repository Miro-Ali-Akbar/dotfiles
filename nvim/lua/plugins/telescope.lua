return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "Find files" })
            vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep  <cr>", { desc = "Live grep" })

            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo tree" })

            -- "nvim-telescope/telescope-ui-select.nvim",
            require("telescope").setup({
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            })
            require("telescope").load_extension("ui-select")

        end
    },
}
