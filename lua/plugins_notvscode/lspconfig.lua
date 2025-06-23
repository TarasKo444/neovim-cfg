return {
  "neovim/nvim-lspconfig",
  automatic_enable = {
    "lua_ls",
    "clangd",
    "pyright"
  },
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup({})
    lspconfig.pyright.setup({})
    lspconfig.lua_ls.setup({
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
