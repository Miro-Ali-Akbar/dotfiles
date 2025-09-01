return {
  "lervag/vimtex",
  event = "BufRead *.tex",
  -- lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "vimtex_aux"
    }
    -- Start on fileopen
    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventInitPost",
      callback = function()
        vim.cmd("VimtexCompile")
      end,
    })
    -- Delete garbage on quit
    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventQuit",
      callback = function()
        vim.fn.system("rm -f *.synctex.gz")
        vim.fn.system("rm -rf vimtex_aux/")
      end,
    })
  end
}
