return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require("fzf-lua")
        local hls = {
            bg  = "PmenuSbar",
            sel = "PmenuSel",
        }
        fzf.setup({
            fzf_opts   = {
                ['--cycle'] = true,
            },
            winopts    = {
                border  = "none",
                preview = {
                    border = "none",
                    scrollbar = "border",
                },
            },
            hls        = {
                border         = hls.bg,
                preview_border = hls.bg,
                preview_title  = hls.sel,
                scrollfloat_f  = hls.sel,
                scrollborder_f = hls.bg,
            },
            fzf_colors = {
                ["gutter"] = { "bg", hls.bg },
                ["bg"]     = { "bg", hls.bg },
                ["bg+"]    = { "bg", hls.sel },
                ["fg+"]    = { "fg", hls.sel },
                -- ["fg+"]    = { "fg", "", "reverse:-1" },
            },
            defaults   = {
                git_icons = false,
                file_icons = false,
            },
            profile    = 'borderless',
            grep       = {
                actions = {
                    ["default"] = require 'fzf-lua.actions'.file_edit
                }
            }
        })
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Files" })
        vim.keymap.set("n", "<leader>fw", fzf.live_grep, { desc = "Words" })
        vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Helptags" })
        vim.keymap.set("n", "<leader>fz", "<cmd> FzfLua <cr>", { desc = "Helptags" })
    end
}
