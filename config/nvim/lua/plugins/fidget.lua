return {
    -- Notifications in down left
    "j-hui/fidget.nvim",
    event = "BufEnter",
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                winblend = 0,
            }
        },
        integration = {
            ["nvim-tree"] = {
                enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
            },
        },
    },
}
