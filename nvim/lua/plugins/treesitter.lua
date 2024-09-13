return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    otps = {
        auto_installed = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
