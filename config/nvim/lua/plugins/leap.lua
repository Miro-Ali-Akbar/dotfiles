return {
  lazy = false,
  url = "https://codeberg.org/andyg/leap.nvim",

  config = function()
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = "Leap forward" })
  end
}
