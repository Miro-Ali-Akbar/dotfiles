return {
    -- Adds colors to color codes eg: #ff5050
    "norcalli/nvim-colorizer.lua",
    config = function()
        require('colorizer').setup()
    end,
}
