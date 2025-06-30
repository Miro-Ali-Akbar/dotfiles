return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<tab>"] = { "actions.close", mode = "n" },
        ["<esc>"] = { "actions.close", mode = "n" },
      },
      float = {
        max_width = 0.8,
        max_height = 0.8,
        border = "",
      },
      view_options = {
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<cr>", { desc = "Oil" })
  end
}
