return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })      
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "jdtls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      require'lspconfig'.jdtls.setup{
        cmd = {'java-lsp.sh'},
        root_dir = require'lspconfig'.util.root_pattern('.git', 'pom.xml', 'build.gradle')
      }
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.coq_lsp.setup({})
      lspconfig.gleam.setup({})
      lspconfig.jdtls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }

}
