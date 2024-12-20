return {
    -- Notifications in down left
    "j-hui/fidget.nvim",
    event = "BufEnter",
    opts = {
        notification = {
            override_vim_notify = true,
        },
    },
}
