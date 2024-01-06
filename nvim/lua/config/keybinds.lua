vim.g.mapleader = " "

-- Movement in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Up" })

-- Movement between windows
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>', { desc = "Window left" })
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>', { desc = "Window right" })
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>', { desc = "Window down" })
vim.keymap.set('n', '<c-k>', ':wincmd k<cr>', { desc = "Window up" })
