return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
      direction = 'float',
      persist_mode = false,
    }
    vim.keymap.set({ "n", "t" }, "<M-\\>", "<cmd>ToggleTerm<CR>")
  end
}
