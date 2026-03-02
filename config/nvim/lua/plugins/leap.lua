return {
  lazy = false,
  url = "https://codeberg.org/andyg/leap.nvim",

  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", { desc = "Leap forward" })
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", { desc = "Leap backward" })
  end
}
