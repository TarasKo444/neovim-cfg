return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000, 
  integrations = {
    treesitter = true,
  },
  config = function()
    require("catppuccin").setup({
      no_italic = true
    })
  end,
}
