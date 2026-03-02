return {
  "its-izhar/kitty-navigator.nvim",
  build = "cp ./kitty/* ~/.config/kitty/",
  config = function()
    require("kitty_navigator").setup({
      keymaps = {
        left  = "<C-h>",
        down  = "<C-j>",
        up    = "<C-k>",
        right = "<C-l>",
      },
    })
  end,
}
