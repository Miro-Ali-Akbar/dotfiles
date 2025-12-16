local layout = {
  layout = {
    backdrop = false,
    box = "horizontal",
    width = 0.8,
    height = 0.8,
    {
      box = "vertical",
      { win = "input", height = 1, },
      { win = "list", },
    },
    { win = "preview", width = 0.7 },
  },
}
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  ---@type snacks.Config
  opts = {
    quickfile = {},
    terminal = {
      enabled = false
    },
    bufdelete = {
      vim.keymap.set("n", "<Tab>c", "<cmd> lua Snacks.bufdelete.delete() <cr>", { desc = "Buffer close" })
    },
    indent = {
      indent = {},
      scope = {
        enabled = true,
        only_current = true,
        hl = {
          -- Match rainbow delimiters
          "RainbowDelimiterRed",
          "RainbowDelimiterBlue",
          "RainbowDelimiterGreen",
          "RainbowDelimiterCyan",
          "RainbowDelimiterYellow",
          "RainbowDelimiterOrange",
          "RainbowDelimiterViolet",
        },
      },
    },
    dashboard = {
      sections = {
        {
          section = "header",
          padding = 5,
        },
        {
          pane = 2,
          section = "terminal",
          cmd = "fortune -s | cowsay",
          height = 10,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    scroll = {enabled = true,},
    rename ={enabled = true,},
    picker = {
      layout = layout,
      win = {
        input = {
          keys = {
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
          },
        },
      },

    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Files" },
    { "<leader>fw", function() Snacks.picker.grep() end,  desc = "Words" },
  },
}
