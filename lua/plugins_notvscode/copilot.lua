return {
  "zbirenbaum/copilot.lua",
  priority = 998,
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
    "saghen/blink.cmp",
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
          accept = "<C-p>",
          -- accept = false,
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

    -- vim.keymap.set("i", "<C-i>", function()
    --   local copilot = require("copilot.suggestion")
    --   if copilot.is_visible() then
    --     copilot.accept()
    --     return ""
    --   else
    --     return "\t"
    --   end
    -- end, { expr = true, silent = true })
  end,
}
