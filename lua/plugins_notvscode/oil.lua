return {
  'stevearc/oil.nvim',
  config = function() 
    require('oil').setup({
      default_file_explorer = true,
      columns = {
        -- "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      constrain_cursor = false,
      lazy = false,
      view_options = {
        show_hidden = true,
      },
      confirmation = {
        border = 'single'
      }
    })
  end
}
