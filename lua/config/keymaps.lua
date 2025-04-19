-- Oil nvim
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

-- open_diagnostic
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })
--format
vim.keymap.set("n", "<leader>cf>", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, {
	desc = "Format current file",
})

--copy paste
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Optional: paste from system clipboard in insert mode
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
