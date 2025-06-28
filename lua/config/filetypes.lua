-- Add this to your init.lua or as a separate config file

-- Enable filetype detection
vim.cmd("filetype plugin indent on")

-- Ensure syntax highlighting is enabled
vim.cmd("syntax enable")

-- Additional filetype associations (if needed)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.html", "*.htm" },
	callback = function()
		vim.bo.filetype = "html"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.css" },
	callback = function()
		vim.bo.filetype = "css"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.js", "*.mjs" },
	callback = function()
		vim.bo.filetype = "javascript"
	end,
})
