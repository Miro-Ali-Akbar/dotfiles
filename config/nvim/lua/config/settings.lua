-- Makes tabs be good and sets indent_space
local indent_space = 4
vim.opt.expandtab = true
vim.opt.tabstop = indent_space
vim.opt.softtabstop = indent_space
vim.opt.shiftwidth = indent_space
-- Sets row number in gutter
vim.cmd("set number")
vim.cmd("set numberwidth=3")
-- Sets clipboard
vim.cmd("set clipboard+=unnamedplus")
-- Makes text wrap be based on words
vim.cmd("set wrap linebreak")
vim.cmd("set breakindent")
-- Adds space for gutter
vim.cmd("set signcolumn=yes")
-- Sets buffer for cursor between border as scroll_of_buffer
vim.cmd("set scrolloff=5")
-- Vim search to be case sensitive when relevant
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- Vim replace - Becomes responsive
vim.cmd("set inccommand=nosplit")
-- Makes nvim faster somehow?
vim.loader.enable()
-- Persistent undo
vim.cmd("set undofile")
-- Mouse = good
vim.cmd("set mouse=a")
-- spell 
vim.opt.spelllang = "en_us,sv"
vim.opt.spell = true
-- Conceal for better markdown and tex
vim.cmd("set conceallevel=2")
-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""
