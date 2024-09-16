return {
  "lervag/vimtex",
  event = "BufRead *.tex",
  -- lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
  end
}
