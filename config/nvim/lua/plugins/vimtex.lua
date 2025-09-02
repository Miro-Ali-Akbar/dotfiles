return {
  "lervag/vimtex",
  event = "BufRead *.tex",
  -- lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "vimtex_aux"
    }
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      'Underfull \\\\hbox',
      'Overfull \\\\hbox',
      'LaTeX Warning: .\\+ float specifier changed to',
      'LaTeX hooks Warning',
      'Package siunitx Warning: Detected the "physics" package:',
      'Package hyperref Warning: Token not allowed in a PDF string',
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
