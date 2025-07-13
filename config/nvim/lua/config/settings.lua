local option = vim.opt
-- Makes tabs be good and sets indent_space
vim.g.Indent_space = 4
option.expandtab = true
option.smartindent = true
option.autoindent = true
option.tabstop = vim.g.Indent_space
option.softtabstop = vim.g.Indent_space
option.shiftwidth = vim.g.Indent_space

-- Sets row number in gutter
option.number = true
option.signcolumn = "yes"
option.numberwidth = 3

-- Sets clipboard
option.clipboard = "unnamedplus"

-- Makes text wrap be based on words
option.wrap = true
option.linebreak = true
option.breakindent = true

-- Sets buffer for cursor between border as scroll_of_buffer
option.scrolloff = 5

-- Vim search to be case sensitive when relevant
option.ignorecase = true
option.smartcase = true

-- Vim replace - Becomes responsive
option.inccommand = "nosplit"

-- Makes nvim faster somehow?
vim.loader.enable()

-- Persistent undo
option.undofile = true

-- Mouse = good TODO: More
option.mouse = "a"

-- spell 
option.spelllang = "en_us,sv"
option.spell = true
option.spelloptions = "camel"
option.iskeyword:append("-")

-- Conceal for better markdown and tex
option.conceallevel = 2

-- Folds
option.foldmethod = "expr"
option.foldexpr = "v:lua.vim.treesitter.foldexpr()"
option.foldlevelstart = 99
option.foldtext = ""

-- Auto read files
option.autoread = true

-- Block selections ignore end of words
option.virtualedit="block"
