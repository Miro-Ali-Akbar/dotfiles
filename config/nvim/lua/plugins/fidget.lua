return {
    -- Notifications in down left
    -- TODO: make text be fully visible
    "j-hui/fidget.nvim",
    event = "BufEnter",
    opts = {
        notification = {
            override_vim_notify = true,
        },
    },
}
