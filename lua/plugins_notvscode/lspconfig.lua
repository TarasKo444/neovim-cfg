return {
  {
    "saghen/blink.cmp",
    lazy = false,
    opts = {
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        use_proximity = true,
        prebuilt_binaries = {
          download = true,
        }
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      signature = { enabled = true },
      completion = {
        ghost_text = { enabled = false, show_with_menu = true },
        keyword = {
          range = 'prefix',
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false
          }
        },
      }
    },
  },
  -- blind.cmp visual
  {
    "xzbdmw/colorful-menu.nvim",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    lazy = false,
    config = function()
      local servers = require('servers')
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
        vim.lsp.enable(server_name)
      end
    end,
  },
}
