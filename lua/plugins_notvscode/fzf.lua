local function writable_buffers()
    require('fzf-lua').buffers({
        filter = function(bufnr)
            local is_modifiable = vim.api.nvim_get_option_value("modifiable", { buf = bufnr })
            local is_readonly = vim.api.nvim_get_option_value("readonly", { buf = bufnr })
            return is_modifiable and not is_readonly
        end
    })
end

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("fzf-lua").setup({ })

    vim.keymap.set("n", "<leader>ff", function () FzfLua.files() end, { silent = true })
    vim.keymap.set("n", "<leader>fg", function () FzfLua.git_files() end, { silent = true })
    vim.keymap.set('n', '<leader>fb', function () FzfLua.buffers() end)
    vim.keymap.set('n', '<leader>fw', writable_buffers, { desc = "List writable buffers" })
    vim.keymap.set("n", "<leader>fh", function () FzfLua.help_tags() end, { silent = true })
    vim.keymap.set("n", "<leader>fa", function () FzfLua.builtin() end, { silent = true })
    vim.keymap.set("n", "<leader>ft", function () FzfLua.colorschemes() end, { silent = true })
  end
}
