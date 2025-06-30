vim.g.mapleader = " "

local map = vim.keymap.set

-- Movement in insert mode
map("i", "<C-h>", "<Left>", { desc = "Left" })
map("i", "<C-l>", "<Right>", { desc = "Right" })
map("i", "<C-j>", "<Down>", { desc = "Down" })
map("i", "<C-k>", "<Up>", { desc = "Up" })

-- Movement between lines for hard wrap
map("n", "j", "gj")
map("n", "k", "gk")

-- Movement between windows
map("n", "<c-h>", ":wincmd h <cr>", { desc = "Window left" })
map("n", "<c-l>", ":wincmd l <cr>", { desc = "Window right" })
map("n", "<c-j>", ":wincmd j <cr>", { desc = "Window down" })
map("n", "<c-k>", ":wincmd k <cr>", { desc = "Window up" })

-- Movement between buffers
map("n", "<Tab>", "<cmd> bn <cr>", { desc = "Buffer next" })
map("n", "<S-Tab>", "<cmd> bp <cr>", { desc = "Buffer previous" })
-- Buffer close -> see ../plugins/snacks.lua

-- Line wrap
map("n", "<leader>cw", "<cmd> set wrap! <cr>", { desc = "Screen wrap" })

-- Vim search
map("n", "<c-n>", "<cmd> nohlsearch <CR>", { desc = "Clear serach" })

-- Vim replace
map("n", "<leader>sr", [[:%s/]], { desc = "Replace all" })

-- Override filetype
map("n", "<leader>ft", [[:set filetype=]], { desc = "Force filetype" })

-- Vim redo
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<S-r>", "<nop>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Disable q: and make to :q
map("n", "q:", "<nop>")
map("n", "q:", "<cmd> q <cr>")

-- Quick commands
map("n", "<leader><leader>", [[:! ]], { desc = "Run command" })

-- Smart deletion from https://www.reddit.com/r/neovim/comments/1janrmf/smart_delete/
local function smart_delete(key)
    local l = vim.api.nvim_win_get_cursor(0)[1]                   -- Get the current cursor line number
    local line = vim.api.nvim_buf_get_lines(0, l - 1, l, true)[1] -- Get the content of the current line
    return (line:match("^%s*$") and '"_' or "") ..
        key                                                       -- If the line is empty or contains only whitespace, use the black hole register
end

local keys = { "d", "dd", "x", "c", "s", "C", "S", "X" } -- Define a list of keys to apply the smart delete functionality

-- Set keymaps for both normal and visual modes
for _, key in pairs(keys) do
    map({ "n", "v" }, key, function()
        return smart_delete(key)
    end, { noremap = true, expr = true, desc = "Smart delete" })
end

-- Put current line above in comments
map("n", "<leader>ck", "m'yyPgcc`'", { remap = true, desc = "Current line commented it" })

-- Paste on row bellow
map("n", "<c-p>", "o<esc>p", { remap = true, desc = "Paste bellow" })

-- Auto correct previous spelling mistake
map("i", "<c-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { remap = true, desc = "Correct previous spelling mistake" })

-- Jump to tag and back
map("n", "<leader>o", "<C-]>", { silent = true, desc = "Jump to tag" })
map("n", "<leader>O", "<C-t>", { silent = true, desc = "Jump to previous tag" })

-- Toggle indent
local function toggle_indent()
    if vim.g.Indent_space == 4 then
        vim.g.Indent_space = 2
    else
        vim.g.Indent_space = 4
    end
    vim.opt.tabstop = vim.g.Indent_space
    vim.opt.softtabstop = vim.g.Indent_space
    vim.opt.shiftwidth = vim.g.Indent_space
end

map("n", "<leader>ct", toggle_indent, { desc = "Indent" })

map("n", "<leader>lF", "m]gg=G`]", { desc = "Format indents" })
