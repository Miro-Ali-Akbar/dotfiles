return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    otps = {
        ensure_installed = { "c", "lua", "bash", "markdown", "typescript", "javascript", "json", "python", "latex" },
        auto_installed = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
