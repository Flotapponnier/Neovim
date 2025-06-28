return {
	-- Better Jinja2 syntax support
	{
		"lepture/vim-jinja",
		ft = { "jinja", "jinja2", "htmljinja", "htmldjango" },
	},
	-- Alternative: if the above doesn't work well
	{
		"Glench/Vim-Jinja2-Syntax",
		ft = { "jinja", "jinja2", "htmljinja", "htmldjango" },
		config = function()
			vim.g.jinja_syntax_html = 1
			-- Fix syntax sync issues
			vim.cmd([[
                augroup JinjaSyntaxFix
                    autocmd!
                    autocmd FileType htmldjango syntax sync minlines=100
                augroup END
            ]])
		end,
	},
}
