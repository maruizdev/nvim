local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', 't', api.node.open.tab, opts('Open'))
	vim.keymap.set('n', 's', api.node.open.vertical, opts('Open'))
	vim.keymap.set('n', '<s-s>', api.node.open.horizontal, opts('Open'))
	vim.keymap.set('n', 't', api.node.open.tab, opts('Open'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- pass to s

require("nvim-tree").setup {
	on_attach = my_on_attach,
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	view = {
		width = 45,
		-- side = "right"
	}
}
