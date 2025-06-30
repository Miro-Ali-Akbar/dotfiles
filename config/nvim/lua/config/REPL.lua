return {
  {
    lazy = false,
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = "all",
        languages = { "r", "python", "html" }, -- "julia", "bash",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten", -- "molten", "slime", "iron" or <function>
        ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
      },
    },
    init = function()
      local runner = require("quarto.runner")
      vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
      vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
      vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
      vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
      vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
      vim.keymap.set("n", "<leader>RA", function()
        runner.run_all(true)
      end, { desc = "run all cells of all languages", silent = true })
      vim.keymap.set('n', '<leader>rs', function()
        vim.cmd('MoltenInit')
        vim.cmd('QuartoActivate')
        require("nabla").enable_virt()
      end, { desc = "Start REPEL" })
      vim.keymap.set("n", "<leader>rI", "<cmd> MoltenInterrupt <cr>", { desc = "Interrupt run" })
      vim.keymap.set("n", "<leader>rr", "<cmd> MoltenShowOutput <cr>", { desc = "Open output" })
      vim.keymap.set("n", "<leader>rR", "<cmd> MoltenHideOutput <cr>", { desc = "Close output" })
    end,
  },
  {
    lazy = false,
    "jmbuhr/otter.nvim",
    config = function()
      require("otter").setup({})
    end,
  },
  {
    lazy = false,
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        output_extension = "md",
        style = "markdown",
        force_ft = "markdown",
      })
    end
  },
  {
    lazy = false,
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    keys = {
      { "<leader>rs", nil, },
    },
    build = ":UpdateRemotePlugins",
    -- To add a enviorment run
    -- "python -m ipykernel install --user --name project_name"
    -- from https://github.com/benlubas/molten-nvim/blob/main/docs/Virtual-Environments.md
    init = function()
      -- vim.g.molten_auto_open_output = true
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_auto_open_output = false
      vim.g.molten_output_win_max_height = 40
    end,
  },
  {
    lazy = false,
    enabled = false,
    'Thiago4532/mdmath.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = { ... }

    -- The build is already done by default in lazy.nvim, so you don't need
    -- the next line, but you can use the command `:MdMath build` to rebuild
    -- if the build fails for some reason.
    -- build = ':MdMath build'
  },
  {
    enabled = true,
    "jbyuki/nabla.nvim",
    keys = {
      { "<leader>cn", nil, desc = "Start inline latex math" },
      { "<leader>rn", nil, desc = "Popup latex math" },
      { "<leader>rs", nil, },
    },
    init = function()
      vim.keymap.set("n", "<leader>cn", "<cmd> lua require(\"nabla\").toggle_virt() <cr>",
        { desc = "Start inline latex math" })
      vim.keymap.set("n", "<leader>rn", "<cmd> lua require(\"nabla\").popup() <cr>", { desc = "Popup latex math" })
    end,
  },
}
