--[[ return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		window = {
			mappings = {
				["<cr>"] = "open"
			}
		}
	},
	-- close_if_last_window = false,
	filesystem = {
		hijack_netrw_behavior = 'open_default',
		
	},
	config = function ()
		
	end

} ]]
return {

}
