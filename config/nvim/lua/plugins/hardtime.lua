return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("hardtime").setup({
            disable_mouse = false,
        })
        -- TODO: Does not work for some reason
        vim.keymap.set("n", "<leader>ch", "<cmd> Hardtime toggle <cr>", { desc = "Hardtime" })
    end,
}
