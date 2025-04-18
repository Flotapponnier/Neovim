
-- Oil nvim
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc="Open Parent Directory in Oil"})

--copy paste
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true, silent = true })

-- Optional: paste from system clipboard in insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
