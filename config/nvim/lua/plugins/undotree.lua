return {
    "jiaoshijie/undotree",
    keys = {
        { "<leader>u", nil, desc = "Undotree" }
    },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require('undotree').setup({
            keymaps = {
                ['<ESC>'] = "quit"
            }
        })
        vim.keymap.set("n", "<leader>u", require('undotree').toggle, { desc = "Undotree" })
    end,
}
