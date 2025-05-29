return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'famiu/bufdelete.nvim'
	},
	opts = {
		options = {
			numbers = "ordinal",
			separator_style = "padded_slant"
		}
	},

	--[[ config = function()
		options = {
			separator_style = "slant",   -- o "thick", "thin", "flat" según prefieras
			always_show_bufferline = true, -- Muestra siempre la barra de buffers
			show_buffer_close_icons = true,
			show_close_icon = true,
		}
	end ]]

}
