return {
  'stevearc/oil.nvim',
  config = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    require('oil').setup({
      default_file_explorer = true,
      columns = {
        -- "icon",
        -- "permissions",
        {"size", highlight = "Special"},
        "mtime",
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      constrain_cursor = 'name',
      lazy = false,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == '..'
        end
      },
      win_options = {
        wrap = true
      },
      confirmation = {
        border = 'single'
      },
    })
  end
}
