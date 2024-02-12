return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 100,
    config = function()
        require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					illuminate = true,
					mason = true,
					native_lsp = { enabled = true },
					nvimtree = true,
					symbols_outline = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
        vim.cmd.colorscheme "catppuccin"
    end
}
