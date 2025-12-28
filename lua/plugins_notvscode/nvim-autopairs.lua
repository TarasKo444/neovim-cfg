return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      map_cr = true,
    })
    vim.api.nvim_set_keymap(
      "i",
      "<S-CR>",
      "v:lua.require'nvim-autopairs'.completion_confirm()",
      { expr = true, noremap = true }
    )
  end,
}
