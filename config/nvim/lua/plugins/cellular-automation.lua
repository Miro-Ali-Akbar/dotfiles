return {
    "Eandrju/cellular-automaton.nvim",
    keys = {
        { "<leader>ca", nil, desc = "Cellular Automaton" },
        { "<leader>cam", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
        { "<leader>cag", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life" },
    },
    config = function()
       vim.keymap.set("n", "<leader>ca", "", { desc = "Cellular Automaton" })
       vim.keymap.set("n", "<leader>cam", "<cmd>CellularAutomaton make_it_rain<cr>", { desc = "Make it rain" })
       vim.keymap.set("n", "<leader>cag", "<cmd>CellularAutomaton game_of_life<cr>", { desc = "Game of life" })
    end
}
