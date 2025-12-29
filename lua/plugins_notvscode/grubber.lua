return {
  "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bold = false,
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
  },
  config = function ()
    vim.api.nvim_set_hl(0, "@type.definition.c", {})
    vim.api.nvim_set_hl(0, "@number.c", { fg = "#ff6200" })
  end
}
