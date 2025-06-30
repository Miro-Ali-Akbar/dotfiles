return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "folke/lazydev.nvim",
    "folke/snacks.nvim",
    "rachartier/tiny-code-action.nvim"

    -- 'akinsho/flutter-tools.nvim', -- flutter
  },
  config = function()
    -- require("flutter-tools").setup() -- flutter
    require("lazydev").setup()
    require("mason").setup()
    require("tiny-code-action").setup({picker = {"snacks"}})
    local code_action = require("tiny-code-action").code_action
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "clangd", "ts_ls", "bashls", "pyright" },
      automatic_installation = true,
    })

    vim.diagnostic.config({ virtual_text = true, })

    local function lsp_toggle_diagnostic()
      vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end

    local function lsp_format()
      vim.lsp.buf.format { async = true }
    end

    local snacks = require("snacks")


    vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Defenition" })
    vim.keymap.set("n", "<leader>lr", snacks.picker.lsp_references, { desc = "References" })
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<leader>la", code_action, { desc = "Code action" })
    vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Diagnostic" })
    vim.keymap.set("n", "<leader>lf", lsp_format, { desc = "Format", noremap = true, })
    vim.keymap.set('n', '<leader>cl', lsp_toggle_diagnostic, { desc = "Lsp diagnostics" })
  end
}
