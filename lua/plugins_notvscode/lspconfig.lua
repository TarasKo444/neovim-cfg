return {
  {
    "saghen/blink.cmp",
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    lazy = false,
    build = 'cargo +nightly build --release',
    opts = {
      keymap = {
        preset = 'none',
        ['<C-i>'] = {},
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'accept', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        -- ['<CR>'] = { 'accept', 'fallback' },
        -- ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation', "fallback" },
        ['<C-y>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-e>'] = { 'scroll_documentation_down', 'fallback' },
        -- ['<C-s>'] = { 'show_signature', 'fallback', 'hide_signature' },
        ['<C-n>'] = { 'snippet_forward', 'fallback' },
        ['<C-s-n>'] = { 'snippet_backward', 'fallback' }
      },
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
      signature = {
        enabled = true,
        trigger = {
          enabled =  true,
        }
      },
      completion = {
        ghost_text = { enabled = false, show_with_menu = true },
        keyword = {
          range = 'prefix',
        },
        accept = { auto_brackets = { enabled = false } },
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
        "nvim-dap-ui",
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

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "Line Diagnostics" })
        vim.keymap.set('n', '<leader>SD', vim.diagnostic.setqflist, { desc = "Project Diagnostics (Quickfix)" })

        vim.keymap.set({ 'n', 'i' }, '<C-Space>', vim.lsp.buf.hover)
        vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help)
      end
    end,
  },
}
