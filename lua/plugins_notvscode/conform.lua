return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        clang_format = {
          args = function()
            local style_str = "{ BasedOnStyle: llvm, " .. "IndentWidth: 4, " .. "AccessModifierOffset: 0" .. " }"

            return { "--style=" .. style_str }
          end,
        },
      },
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })

    vim.keymap.set("v", "<leader>=", vim.cmd.Format)
    vim.keymap.set("n", "<leader>f=", vim.cmd.Format)
  end,
}
