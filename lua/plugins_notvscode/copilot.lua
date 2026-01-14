return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 40,
        trigger_on_accept = true,
        keymap = {
          accept = "<C-i>",
          accept_word = false,
          accept_line = false,
        },
      },
      -- nes = {
      --   enabled = true,
      --   auto_trigger = true,
      --   keymap = {
      --     dismiss = "<Esc>",
      --   },
      -- },
    })

    -- vim.keymap.set({ "n", "i", "v" }, "<M-i>", function()
    --   local bufnr = vim.api.nvim_get_current_buf()
    --   local state = vim.b[bufnr].nes_state
    --   if state then
    --     require("copilot-lsp.nes").walk_cursor_start_edit()
    --     require("copilot-lsp.nes").apply_pending_nes()
    --     require("copilot-lsp.nes").walk_cursor_end_edit()
    --     return nil
    --   else
    --     return "<M-i>"
    --   end
    -- end, { desc = "Accept Copilot NES suggestion", expr = true })
  end,
}
