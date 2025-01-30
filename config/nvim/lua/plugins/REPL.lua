return {
	{
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
		end,
	},
	{
		"jmbuhr/otter.nvim",
		config = function()
			require("otter").setup({})
		end,
	},
	{
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
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_auto_open_output = true
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
		end,
	},
	{
		"jbyuki/nabla.nvim",
		init = function()
			vim.keymap.set("n", "<leader>cn", "<cmd> lua require(\"nabla\").toggle_virt() <cr>", { desc = "Start inline latex math"})
		end,
	},
}
