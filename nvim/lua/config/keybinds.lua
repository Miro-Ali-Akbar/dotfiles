vim.g.mapleader = " "

-- Movement in insert mode
vim.keymap.set("i", "<C-h>", "<Left>",  { desc = "Left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })
vim.keymap.set("i", "<C-j>", "<Down>",  { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>",    { desc = "Up" })

-- Movement between lines for hardwrap
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
-- Buffer close
vim.keymap.set("n", "<Tab>c",   "<cmd> bd <cr>", { desc = "Buffer close"})

-- Line wrap
vim.keymap.set("n", "<leader>cw", "<cmd> set wrap! <cr>", { desc = "Screen wrap" })

-- Vim search
vim.keymap.set("n", "<c-n>", "<cmd> nohlsearch <CR>", { desc = "Clear serach" })

-- Vim replace
vim.keymap.set("n", "<leader>sr", [[:%s/]], { desc = "Replace all" })

-- Vim redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<S-r>", "<nop>")

-- TODO: make this
function SurroundSelectedText(suffix_char)
    -- Get the selected text
    local selected_text = vim.fn.getreg(vim.v.register)

    -- Get the start and end positions of the visual selection
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Modify the text in the buffer to surround the selected text
    vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3] - 1, {suffix_char .. selected_text .. suffix_char})
end


vim.keymap.set({ "v", "x" }, "<Leader>s", ":lua SurroundSelectedText()<left>", { noremap = true, silent = true })
