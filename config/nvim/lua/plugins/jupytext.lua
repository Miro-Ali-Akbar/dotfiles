return {
	"GCBallesteros/jupytext.nvim",
  config = function()
    require("jupytext").setup({
			output_extension = "md",
			style = "markdown",
			force_ft = "markdown", -- you can set whatever filetype you want here
    })
  end
}
