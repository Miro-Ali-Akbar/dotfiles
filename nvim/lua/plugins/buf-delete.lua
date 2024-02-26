return {
    "famiu/bufdelete.nvim",
    config = function ()
        vim.keymap.set("n", "<Tab>c",   "<cmd> Bdelete <cr>", { desc = "Buffer close"})
    end
}
