return {
    "edluffy/hologram.nvim",
    enabled = false,
    config = function()
        require("hologram").setup({
            autodisplay = true
        })
    end
}
