return {
	"MunifTanjim/prettier.nvim",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("prettier").setup({
			bin = 'prettier', -- usa el binario global o del proyecto
			filetypes = {
				"javascript", "javascriptreact", "typescript", "typescriptreact",
				"json", "css", "scss", "html", "markdown", "yaml"
			},
		})
	end
}
