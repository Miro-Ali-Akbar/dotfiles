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
    image = {
      enabled = true,
      force_magick = true,
      math = {
        enabled = true,
        conceal = true,
      }
    },
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
    scroll = { enabled = true, },
    rename = { enabled = true, },
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
  config = function(_, opts)
    require("snacks").setup(opts)
    -- Inline images are off until toggled with <leader>ci
    vim.g.snacks_images = false
    local inline = require("snacks.image.inline")
    local update = inline.update
    inline.update = function(self)
      if vim.g.snacks_images then update(self) end
    end
  end,
  keys = {
    {
      "<leader>ci",
      function()
        vim.g.snacks_images = not vim.g.snacks_images
        if vim.g.snacks_images then
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            pcall(vim.api.nvim_exec_autocmds, "WinScrolled", { group = "snacks.image.inline." .. buf, buffer = buf })
          end
        else
          Snacks.image.placement.clean()
        end
        vim.notify("Images " .. (vim.g.snacks_images and "on" or "off"))
      end,
      desc = "Images",
    },
    { "<leader>ff", function() Snacks.picker.smart() end,                     desc = "Files" },
    { "<leader>fw", function() Snacks.picker.grep() end,                      desc = "Words" },
    { "<leader>v",  function() Snacks.picker.yanky() end,                     desc = "Yank history" },

    { "<leader>fi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>fI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>fp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>fP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
    { "<leader>cb", function() Snacks.git.blame_line() end,                   desc = "Git Blame" },
  },
}
