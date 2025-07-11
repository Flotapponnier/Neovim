return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- Install parsers for web development
				ensure_installed = {
					"html",
					"css",
					"javascript",
					"python",
					"lua",
					"vim",
					"vimdoc",
					"json",
					"markdown",
					"bash",
					"yaml",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				auto_install = true,

				-- Enable syntax highlighting
				highlight = {
					enable = true,
					-- Disable treesitter for htmldjango to avoid conflicts with regex syntax
					disable = { "htmldjango" },
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					additional_vim_regex_highlighting = { "htmldjango" },
				},

				-- Enable indentation
				indent = {
					enable = true,
				},

				-- Enable incremental selection
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ao"] = "@comment.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
						swap_next = {
							["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
						},
					},
				},
			})
		end,
	},
}
