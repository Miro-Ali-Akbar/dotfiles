-- Makes tabs be good and sets indent_space
local indent_space = 4
vim.opt.expandtab = true
vim.opt.tabstop = indent_space
vim.opt.softtabstop = indent_space
vim.opt.shiftwidth = indent_space
-- Sets rownumber in gutter
vim.cmd("set number")
vim.cmd("set numberwidth=3")
-- Sets clipboard
vim.cmd("set clipboard+=unnamedplus")
-- Makes text wrap be based on words
vim.cmd("set wrap linebreak")
-- Adds space for gutter
vim.cmd("set signcolumn=yes")
-- Sets buffer for curser between border as scroll_of_buffer
vim.cmd("set scrolloff=5")
-- Vim search
vim.cmd("set smartcase")
