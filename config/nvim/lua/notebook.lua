return {
    -- {
    --     "GCBallesteros/NotebookNavigator.nvim",
    --     keys = {
    --         { "]h", function() require("notebook-navigator").move_cell "d" end },
    --         { "[h", function() require("notebook-navigator").move_cell "u" end },
    --         { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    --         { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    --     },
    --     dependencies = {
    --         "echasnovski/mini.comment",
    --         -- "hkupty/iron.nvim", -- repl provider
    --         -- "akinsho/toggleterm.nvim", -- alternative repl provider
    --         "benlubas/molten-nvim", -- alternative repl provider
    --         "anuvyklack/hydra.nvim",
    --     },
    --     event = "VeryLazy",
    --     config = function()
    --         local nn = require "notebook-navigator"
    --         nn.setup({ activate_hydra_keys = "<leader>h" })
    --     end,
    --
    -- },
    {
        "quarto-dev/quarto-nvim",
        ft = { "quarto", "markdown" },
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            debug = false,
            closePreviewOnExit = true,
            lspFeatures = {
                enabled = true,
                chunks = "curly",
                languages = { "r", "python", "html" }, -- "julia", "bash",
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                completion = {
                    enabled = true,
                },
            },
            codeRunner = {
                enabled = true,
                default_method = "molten", -- "molten", "slime", "iron" or <function>
                ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
                -- Takes precedence over `default_method`
                never_run = { "yaml" }, -- filetypes which are never sent to a code runner
            },
        },
        init = function()
            local runner = require("quarto.runner")
            vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
            vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
            vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
            vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
            vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
            vim.keymap.set("n", "<leader>RA", function()
                runner.run_all(true)
            end, { desc = "run all cells of all languages", silent = true })
        end,
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_auto_open_output = true
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require("jupytext").setup({
                output_extension = "md",
                style = "markdown",
                force_ft = "markdown", -- you can set whatever filetype you want here
            })
        end
    },

}
