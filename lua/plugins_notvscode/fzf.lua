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
    vim.keymap.set("n", "<leader>ft", function () FzfLua.colorschemes() end, { silent = true })
  end
}
