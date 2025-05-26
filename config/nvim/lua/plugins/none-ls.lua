return {
    enabled = false,
    "jay-babu/mason-null-ls.nvim",
    event = "InsertEnter",
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-null-ls").setup({
            automatic_installation = true,
            handlers = {},
        })
    end,
}
