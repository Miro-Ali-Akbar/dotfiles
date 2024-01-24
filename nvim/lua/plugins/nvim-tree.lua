return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",

    config = function()
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Floating tree" })
        vim.keymap.set("n", "<Esc>", "<cmd>NvimTreeClose<cr>", { desc = "Close tree" })
        local WIDTH_RATIO = 0.89
        local HEIGHT_RATIO = 0.79

        require("nvim-tree").setup({
            git = {
                enable = false,
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() -- - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = (screen_h - window_h) / 2
                        return {
                            border = "single",
                            relative = "editor",
                            style = "minimal",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
            },
        })
    end
}
