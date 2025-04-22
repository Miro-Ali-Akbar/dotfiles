return {
    lazy = false,
    "notjedi/nvim-rooter.lua",
    dependencies = {
        "nvim-tree/nvim-tree.lua",
    },
    config = function()
        require "nvim-rooter".setup()
    end
}
