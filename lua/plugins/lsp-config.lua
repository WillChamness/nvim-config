return {
	{
		-- install each formatter and linter with :Mason command
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- auto_install = true -- automatically install language server that isnt already installed

				-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"pylsp",
					"pyright",
					"jedi_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- setup LSPs here
			-- lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- typescript
			lspconfig.tsserver.setup({ capabilities = capabilities })
			-- python
			-- lspconfig.pyright.setup({ capabilities = capabilities, filetypes = { "python" } })
			lspconfig.jedi_language_server.setup({ capabilities = capabilities, filetypes = { "python" } })
			-- lspconfig.pylsp.setup({capabilities = capabilities})

			-- global kepmaps
			vim.keymap.set("n", "<leader>ldc", vim.diagnostic.open_float) -- open diagnostic window on cursor location
			vim.keymap.set("n", "<leader>ldn", vim.diagnostic.goto_next) -- open next diagnostic window
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- open next diagnostic window
			vim.keymap.set("n", "<leader>ldp", vim.diagnostic.goto_prev) -- open previous diagnostic window
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- open previous diagnostic window

			-- create additional keymaps AFTER attaching to the LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts) -- show documentation where cursor is
					vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, opts) -- show the definition of the variable/function
					vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.type_definition, opts) -- show the type definition
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts) -- show all references to variable/function
					vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts) -- show auto-generated solutions to warnings and errors
				end,
			})
		end,
	},
}
