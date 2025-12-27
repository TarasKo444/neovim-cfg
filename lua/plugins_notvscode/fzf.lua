
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("fzf-lua").setup({ })

    vim.keymap.set("n", "<leader>ff", function () FzfLua.files() end, { silent = true })
    vim.keymap.set("n", "<leader>fg", function () FzfLua.git_files() end, { silent = true })
    vim.keymap.set("n", "<leader>fb", function () FzfLua.buffers() end, { silent = true })
    vim.keymap.set("n", "<leader>fh", function () FzfLua.help_tags() end, { silent = true })
    vim.keymap.set("n", "<leader>fa", function () FzfLua.builtin() end, { silent = true })
  end

  -- config = function()
  --   local builtin = require('telescope.builtin')
  --   vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  --   vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  --   vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  --   vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  --
  --   local actions = require("telescope.actions")
  --   require('telescope').setup{
  --     defaults = {
  --       file_ignore_patterns = { "node_modules" },
  --       path_display = { "truncate" },
  --       mappings = {
  --         i = {
  --           ["<esc>"] = actions.close,
  --           ["<C-j>"] = actions.move_selection_next,
  --           ["<C-k>"] = actions.move_selection_previous,
  --         }
  --       }
  --     },
  --   }
  -- end,
}
