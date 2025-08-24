return {
  "A7Lavinraj/fyler.nvim",
  config = function()
    require("fyler").setup({
      default_explorer = true,
      icon_provider = function()
        return ""
      end,
      git_status = false,
      views = {
        confirm = {
          win = {
            kind = "float",
            border = "",
          },
        },
        explorer = {
          win = {
            kind = "float",
            border = "",
          },
        },
      },
      mappings = {
        confirm = {
          ["y"] = "Confirm",
          ["<CR>"] = "Confirm",
          ["n"] = "Discard",
          ["<ESC>"] = "Discard",
        },
        explorer = {
          ["q"] = "CloseView",
          ["<ESC>"] = "CloseView",
          ["<CR>"] = "Select",
        },
      },
      explorer = {
        confirm_simple = true,
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>Fyler<cr>", { desc = "Fyler" })
  end,
}
