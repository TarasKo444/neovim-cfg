return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('lualine').setup({
      extensions = { 'fzf', 'oil', 'toggleterm', 'quickfix' },
      options = {
        theme = 'onedark',
      }
    })
  end
}
