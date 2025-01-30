return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "bash", "markdown", "markdown_inline", "typescript", "javascript", "json", "python", "latex" },
            auto_installed = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
