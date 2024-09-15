return {
    -- Notifications in down left
    "j-hui/fidget.nvim",
    event = "BufEnter",
    config = function()
        -- Turn on LSP, formatting, and linting status and progress information
        local fidget = require("fidget")
        fidget.setup({})
        vim.notify = fidget.notify
    end,
}
