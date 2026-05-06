return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            direction = 'float',
        })
        vim.keymap.set("n", "<leader>tf", "<cmd> ToggleTerm direction=float <cr>", { desc = "Floating" })
        vim.keymap.set("n", "<leader>tt", "<cmd> ToggleTerm direction=horizontal<cr>", { desc = "Normal" })
        vim.keymap.set("t", "<Esc>", "<Cmd> ToggleTerm <cr>", { desc = "Toggle terminal" })

        -- Send the current line to the terminal
        vim.keymap.set('n', '<leader>tx', ':ToggleTermSendCurrentLine<CR><cmd> ToggleTerm direction=float <cr>', {
            noremap = true,
            silent = true,
            desc = "Send line to terminal"
        })

        -- Send the visual selection to the terminal
        vim.keymap.set('v', '<leader>tx', ':ToggleTermSendVisualLines<CR><cmd> ToggleTerm direction=float <cr>', {
            noremap = true,
            silent = true,
            desc = "Send selection to terminal"
        })

        vim.keymap.set('n', '<leader>tr', function()
            local t = require('toggleterm.terminal').get(1)
            if t then
                t:shutdown()
            end
            vim.cmd("ToggleTerm direction=float")
        end, { noremap = true, silent = true, desc = "Restart floating terminal" })
    end,

}
