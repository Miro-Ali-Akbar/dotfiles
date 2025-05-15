-- Makes tabs be good and sets indent_space
local indent_space = 4
vim.opt.expandtab = true
vim.opt.tabstop = indent_space
vim.opt.softtabstop = indent_space
vim.opt.shiftwidth = indent_space

-- Sets row number in gutter
vim.opt.number = true
vim.opt.numberwidth = 3

-- Sets clipboard
vim.opt.clipboard = "unnamedplus"

-- Makes text wrap be based on words
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Adds space for gutter
vim.opt.signcolumn = "yes"

-- Sets buffer for cursor between border as scroll_of_buffer
vim.opt.scrolloff = 5

-- Vim search to be case sensitive when relevant
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Vim replace - Becomes responsive
vim.opt.inccommand = "nosplit"

-- Makes nvim faster somehow?
vim.loader.enable()

-- Persistent undo
vim.opt.undofile = true

-- Mouse = good TODO: More
vim.opt.mouse = "a"

-- spell 
vim.opt.spelllang = "en_us,sv"
vim.opt.spell = true
vim.opt.spelloptions = "camel"

-- Conceal for better markdown and tex
vim.opt.conceallevel = 2

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""
