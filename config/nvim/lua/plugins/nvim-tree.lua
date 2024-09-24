return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle" },

    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            vim.keymap.set('n', '?', api.tree.toggle_help, { desc = "Help", buffer = bufnr })
            vim.keymap.set("n", "<C-CR>", api.tree.change_root_to_node, { desc = "Change root", buffer = bufnr })
            vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, { desc = "Open file in current window", buffer = bufnr })
            -- Default
            vim.keymap.set("n", "a", api.fs.create, { desc = "Create", buffer = bufnr })
            vim.keymap.set("n", "d", api.fs.remove, { desc = "Delete", buffer = bufnr })
            vim.keymap.set("n", "D", api.fs.trash, { desc = "Trash", buffer = bufnr })
            vim.keymap.set("n", "q", api.tree.close, { desc = "Close", buffer = bufnr })
            vim.keymap.set("n", "r", api.fs.rename, { desc = "Rename", buffer = bufnr })
            vim.keymap.set("n", "R", api.tree.reload, { desc = "Refresh", buffer = bufnr })
            vim.keymap.set("n", "x", api.fs.cut, { desc = "Cut", buffer = bufnr })
            vim.keymap.set("n", "y", api.fs.copy.filename, { desc = "Copy Name", buffer = bufnr })
            vim.keymap.set("n", "Y", api.fs.copy.relative_path, { desc = "Copy Relative Path", buffer = bufnr })
        end

        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Floating tree" })
        vim.keymap.set("n", "<Esc>", "<cmd>NvimTreeClose<cr>", { desc = "Close tree" })

        local WIDTH_RATIO = 0.89
        local HEIGHT_RATIO = 0.79

        require("nvim-tree").setup({
            filters = { custom = { "^.git$" } },
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
            on_attach = my_on_attach,
        })
    end
}
