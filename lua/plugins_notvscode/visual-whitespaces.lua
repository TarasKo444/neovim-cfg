return {
  'mcauley-penney/visual-whitespace.nvim',
  event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
  opts = {
    enabled = true,
    highlight = { link = "Visual", default = true },
    match_types = {
      space = true,
      tab = true,
      nbsp = false,
      lead = false,
      trail = false,
    },
    list_chars = {
      space = "·",
      tab = "→",
    },
    fileformat_chars = {
      unix = "",
      mac = "",
      dos = "",
    },
    ignore = { filetypes = {}, buftypes = {} },
  }
}
