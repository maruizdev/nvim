vim.cmd [[highlight TSCurrentScope guibg=#75f]]
return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-refactor'
	},
	build = ":TSUpdate",
	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			ensure_installed = {
				"html",
				"css",
				"scss",
				"vue",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"json",
				"php",
				"lua",
				"vim",
				"c",
				"bash"
			},
			auto_install = false
		})
	end
}
