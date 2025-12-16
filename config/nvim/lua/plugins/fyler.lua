return {
    -- enabled = false;
    "A7Lavinraj/fyler.nvim",
    lazy = false,
    branch = "stable",
    config = function()
        require("fyler").setup({
            hooks = {
                on_rename = function(src_path, destination_path)
                    Snacks.rename.on_rename_file(src_path, destination_path)
                end,
            },
            integrations = {
                icon = "none",
                -- winpick = "snacks",
                -- opts = {
                --
                -- }
            },
            viewes = {
                win = {
                    border = "none"
                },
                finder = {
                    confirm_simple = true,
                    delete_to_trash = true,
                },
            },
        })
        vim.keymap.set("n", "<leader>e", "<cmd>Fyler kind=float<cr>", { desc = "Fyler" })
    end,
}
