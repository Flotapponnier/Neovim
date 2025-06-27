-- FILE: lua/plugins/jinja2.lua
-- Flask/Jinja2 template support for your boba.vim project

return {
	-- Jinja2 syntax highlighting
	{
		"Glench/Vim-Jinja2-Syntax",
		ft = { "html", "jinja", "jinja2", "htmljinja" },
	},

	-- Better HTML support for your Flask templates
	{
		"othree/html5.vim",
		ft = "html",
	},

	-- Emmet for faster HTML writing (great for Flask templates)
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript" },
		config = function()
			-- Enable emmet in jinja templates
			vim.g.user_emmet_settings = {
				html = {
					extensions = { "html", "jinja2", "htmljinja" },
				},
			}
		end,
	},
}
