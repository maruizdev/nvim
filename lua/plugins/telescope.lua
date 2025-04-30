return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						["<C-t>"] = actions.select_tab,
					},
					n = {
						["<c-t>"] = actions.select_tab,
					},
				},
			},
		}
	end
}
