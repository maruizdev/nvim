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
	config = function()
		options = {
			-- No abrir pestañas nuevas, solo buffers
			separator_style = "slant",   -- o "thick", "thin", "flat" según prefieras
			always_show_bufferline = true, -- Muestra siempre la barra de buffers
			show_buffer_close_icons = true,
			show_close_icon = true,
			-- Puedes personalizar el comportamiento de abrir un archivo en el buffer actual:
			-- Cambiar la acción de abrir nuevos buffers a no abrir en una nueva ventana o pestaña
		}
	end

}
