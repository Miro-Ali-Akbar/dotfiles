-- plugins/quarto.lua
return {
	"quarto-dev/quarto-nvim",
	ft = { "quarto" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		debug = false,
		closePreviewOnExit = true,
		lspFeatures = {
			enabled = true,
			chunks = "curly",
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
			-- Takes precedence over `default_method`
			never_run = { "yaml" }, -- filetypes which are never sent to a code runner
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
	end,
}
