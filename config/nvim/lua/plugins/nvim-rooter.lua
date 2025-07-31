return {
    lazy = false,
    "notjedi/nvim-rooter.lua",
    config = function()
        require "nvim-rooter".setup({
            exclude_filetypes = { "man", "troff" }
        })
    end
}
