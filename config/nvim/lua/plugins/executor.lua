return {
  enabled = false,
  lazy = false,
  "google/executor.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("executor").setup({
      use_split = false,
    })
    local api = require("executor").commands
    local function set_and_run()
      api.set_command()
      api.run()
    end
    vim.keymap.set('n', "<leader><leader>", set_and_run, { desc = "Execute" })
    vim.keymap.set('n', "<leader>d", api.show_detail, { desc = "Show detail" })
    vim.keymap.set('n', "q", api.hide_detail, { desc = "hide" })
    vim.keymap.set('n', "<ESC>", api.hide_detail, { desc = "hide" })
  end,
}
