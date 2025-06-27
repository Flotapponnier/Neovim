-- FILE: lua/config/filetypes.lua
-- Auto-detection for Flask/Jinja2 templates

-- Auto-detect Jinja2 templates in .html files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.html" },
	callback = function()
		-- Read first 20 lines to check for Jinja2 syntax
		local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
		for _, line in ipairs(lines) do
			if
				line:match("{%%")
				or line:match("{{")
				or line:match("{#")
				or line:match("extends")
				or line:match("block")
			then
				vim.bo.filetype = "htmljinja"
				break
			end
		end
	end,
})

-- Configure settings for Jinja2 templates
vim.api.nvim_create_autocmd("FileType", {
	pattern = "htmljinja",
	callback = function()
		vim.bo.shiftwidth = 2 -- Use 2 spaces for HTML templates
		vim.bo.tabstop = 2
		vim.bo.expandtab = true
		vim.bo.commentstring = "{# %s #}" -- Jinja2 comment style
	end,
})

-- Create a command to manually set Jinja2 filetype
vim.api.nvim_create_user_command("SetJinja", function()
	vim.bo.filetype = "htmljinja"
	print("Filetype set to htmljinja - Jinja2 syntax enabled!")
end, { desc = "Set filetype to htmljinja for Jinja2 templates" })

-- Optional: Create a command to go back to regular HTML
vim.api.nvim_create_user_command("SetHTML", function()
	vim.bo.filetype = "html"
	print("Filetype set to html")
end, { desc = "Set filetype to regular HTML" })
