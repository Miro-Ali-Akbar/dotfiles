return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 100,
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				fidget = true,
				gitsigns = true,
				illuminate = true,
				leap = true,
				mason = true,
				native_lsp = { enabled = true },
				nvimtree = true,
				rainbow_delimiters = true,
				snacks = { enabled = true },
				symbols_outline = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
