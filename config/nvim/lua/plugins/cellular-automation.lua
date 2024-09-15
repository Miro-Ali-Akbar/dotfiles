return {
    "Eandrju/cellular-automaton.nvim",
    config = function()
       vim.keymap.set("n", "<leader>ca", "", { desc = "Cellular Automaton" })
       vim.keymap.set("n", "<leader>cam", "<cmd>CellularAutomaton make_it_rain<cr>", { desc = "Make it rain" })
       vim.keymap.set("n", "<leader>cag", "<cmd>CellularAutomaton game_of_life<cr>", { desc = "Game of life" })
    end
}
