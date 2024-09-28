return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "jdtls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Pyright LSP
			lspconfig.pyright.setup({
				on_attach = function(client, bufnr)
					print("LSP anexado ao buffer", bufnr)
					local opts = { noremap = true, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- Altere para "strict" se quiser verificações mais rígidas
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
          },
        },
      })

      -- Outro LSP's:
      lspconfig.jdtls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.gleam.setup({})
      lspconfig.rust_analyzer.setup({})
      require'lspconfig'.hls.setup{
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { 'haskell', 'lhaskell' },
      }


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {}) -- Exibir o diagnóstico em um balão
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {}) -- Ir para o erro anterior
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {}) -- Ir para o próximo erro
		end,
	},
}
