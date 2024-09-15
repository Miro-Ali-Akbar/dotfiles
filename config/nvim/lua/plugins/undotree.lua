return {
    "jiaoshijie/undotree",
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
