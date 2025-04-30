return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		local on_attach = function(_, bufnr)
			vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
			vim.keymap.set("n", 'K', vim.lsp.buf.hover, {buffer = bufnr})

			local opts = { buffer = bufnr }
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gy", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)

			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
			  end, opts)

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<F4>", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end
		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = {enable = true},
					workspace = {checkThirdDarty = false}
				}
			}

		})

		require'lspconfig'.ts_ls.setup{
			on_attach = on_attach,
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = {"javascript", "typescript", "vue"},
					},
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"vue",
				"typescriptreact"
			},
		}
		
		-- local project_library_path = "/home/marcelo/.nvm/versions/node/v20.18.0/lib/node_modules/@angular/language-server"
		-- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}

		local ok, mason_registry = pcall(require, 'mason-registry')
		if not ok then
			vim.notify 'mason-registry could not be loaded'
			return
		end

		local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()


		local cmd = {
			'ngserver',
			'--stdio',
			'--tsProbeLocations',
			table.concat({
				angularls_path,
				vim.uv.cwd(),
			}, ','),
			'--ngProbeLocations',
			table.concat({
				angularls_path .. '/node_modules/@angular/language-server',
				vim.uv.cwd(),
			}, ','),
		}

		require'lspconfig'.angularls.setup{
			on_attach = on_attach,
			cmd = cmd,
			on_new_config = function(new_config,new_root_dir)
				new_config.cmd = cmd
			end
		}

		require'lspconfig'.emmet_language_server.setup{
			on_attach = on_attach,
		}

		--Enable (broadcasting) snippet capability for completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require'lspconfig'.html.setup {
			capabilities = capabilities,
		}
		require'lspconfig'.tailwindcss.setup({
			on_attach = on_attach,
				capabilities = capabilities
			}
		)
	end
}
