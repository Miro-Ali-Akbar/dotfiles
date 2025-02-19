vim.g.mapleader = " "

-- Movement in insert mode
vim.keymap.set("i", "<C-h>", "<Left>",  { desc = "Left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })
vim.keymap.set("i", "<C-j>", "<Down>",  { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>",    { desc = "Up" })

-- Movement between lines for hard wrap
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Movement between windows
vim.keymap.set("n", "<c-h>", ":wincmd h <cr>", { desc = "Window left" })
vim.keymap.set("n", "<c-l>", ":wincmd l <cr>", { desc = "Window right" })
vim.keymap.set("n", "<c-j>", ":wincmd j <cr>", { desc = "Window down" })
vim.keymap.set("n", "<c-k>", ":wincmd k <cr>", { desc = "Window up" })

-- Movement between buffers
vim.keymap.set("n", "<Tab>",    "<cmd> bn <cr>", { desc = "Buffer next"})
vim.keymap.set("n", "<S-Tab>",  "<cmd> bp <cr>", { desc = "Buffer previous"})
-- Buffer close -> see ../plugins/snacks.lua

-- Line wrap
vim.keymap.set("n", "<leader>cw", "<cmd> set wrap! <cr>", { desc = "Screen wrap" })

-- Vim search
vim.keymap.set("n", "<c-n>", "<cmd> nohlsearch <CR>", { desc = "Clear serach" })

-- Vim replace
vim.keymap.set("n", "<leader>sr", [[:%s/]], { desc = "Replace all" })

-- Vim redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<S-r>", "<nop>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Disable q: and make to :q
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "q:", "<cmd> q <cr>")

-- Quick commands
vim.keymap.set("n", "<leader><leader>", [[:! ]], { desc = "Run command" })
