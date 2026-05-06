return {
  -- Adds colors to color codes eg: #ff5050
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      options = {
        parsers = {
          css = true,
          tailwind = { enable = true },
        },
        display = {
          mode = "virtualtext",
          virtualtext = { position = "after" },
        },
      },
    })
  end
}
