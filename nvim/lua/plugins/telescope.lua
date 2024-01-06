return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Live grep" })

            require("telescope").load_extension("undo")
            vim.keymap.set('n', '<leader>u', "<cmd>Telescope undo<cr>", { desc = "Undo tree" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
