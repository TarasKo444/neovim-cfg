return {
  "neovim/nvim-lspconfig",
  automatic_enable = {
    "lua_ls",
    "clangd",
    "pyright"
  },
  config = function()
    -- local lspconfig = require('lspconfig')
    vim.lsp.config("clangd", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        }
      }
    })
  end,
}
