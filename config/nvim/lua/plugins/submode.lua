return {
    "pogyomo/submode.nvim",
    lazy = false,
    config = function()
        local submode = require("submode")

        submode.create("WinMove", {
            mode = "n",
            enter = "<leader>w",
            leave = { "q", "<ESC>" },
            default = function(register)
                register("<", "<C-w><")
                register(">", "<C-w>>")
                register("+", "<C-w>+")
                register("-", "<C-w>-")
                register("h", "<C-w>h")
                register("j", "<C-w>j")
                register("k", "<C-w>k")
                register("l", "<C-w>l")
            end
        })
    end
}
