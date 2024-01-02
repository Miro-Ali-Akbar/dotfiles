vim.g.mapleader = " "

-- Movement in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")--, { "Left" })
vim.keymap.set("i", "<C-l>", "<Right>")--, { "Right" })
vim.keymap.set("i", "<C-j>", "<Down>")--, { "Down" })
vim.keymap.set("i", "<C-k>", "<Up>")--, { "Up" })

-- Movement between windows
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>')--, {"Window left"})
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>')--, {"Window right"})
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>')--, {"Window down"})
vim.keymap.set('n', '<c-k>', ':wincmd k<cr>')--, {"Window up"})
