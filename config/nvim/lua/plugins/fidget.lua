return {
    -- Notifications in down left
    "j-hui/fidget.nvim",
    event = "BufEnter",
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                winblend = 0,
                normal_hl = "NormalFloat", -- solid text and background
            }
        },
    },
}
