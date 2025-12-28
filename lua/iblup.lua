require("lazy_init")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  -- { import = "plugins_always",    cond = true },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup({ }) end
  },
  { import = "plugins_notvscode", cond = (function() return not vim.g.vscode end) },
  { import = "plugins_vscode",    cond = (function() return vim.g.vscode end) },
})

vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:1"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.updatetime = 750

vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:  "
vim.opt.guicursor = {
  'n-v-c:block-Cursor',
  'i-ci:block-Cursor/lCursor-blinkon400-blinkoff400',
  'r:block-Cursor'
}
-- vim.diagnostic.config({ virtual_text = true, update_in_insert = false, })

vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add new line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add new line above" })
vim.keymap.set('n', 'go', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Add empty line below (count aware, preserves cursor)" })
vim.keymap.set('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Add empty line above (count aware, preserves cursor)" })

local opts = { noremap = true, silent = true }

vim.keymap.set({"n", "v"}, "<leader>y", '"+y', opts)
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', opts)
vim.keymap.set({"n", "v"}, "<leader>Y", '"+Y', opts)
vim.keymap.set({"n", "v"}, "<leader>P", '"+P', opts)

-- delete to clipboard
vim.keymap.set({"n", "v"}, "<leader>d", '"+d', { noremap = true, silent = true })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv-gv", opts)
-- vim.keymap.set("v", "J", ":m .+1<CR>==", opts)
-- vim.keymap.set("v", "K", ":m .-2<CR>==", opts)
-- vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
-- vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

vim.keymap.set('n', 'J', "mzJ`z")

-- make search in the middle
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { silent = true })

-- renames everything selected
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>")

-- leave terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set('n', '<leader>q', vim.cmd.quit, { desc = "Quit" })

-- no more comments on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Set CWD to current file or Oil directory",
    callback = function()
        local path = vim.api.nvim_buf_get_name(0)
        if path:sub(1, 6) == "oil://" then
            local real_path = path:sub(7)
            vim.api.nvim_set_current_dir(real_path)
        elseif path ~= "" and vim.bo.buftype == "" then
            vim.api.nvim_set_current_dir(vim.fs.dirname(path))
        end
    end,
})

vim.api.nvim_create_user_command(
  'RemoveCarriageReturns', function()
    vim.cmd('silent! %s/\\r//g')
    print("Carriage returns removed.")
  end,
  { desc = 'Remove carriage return characters from the buffer', }
)

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      timeout = 200, -- milliseconds
      -- Optional: change the highlight group
      -- higroup = "Visual",
    })
  end,
})

if vim.g.vscode then
  -- VSCode Neovim
  require("vscode_keymaps")
else
  vim.cmd.colorscheme("gruber-darker")
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#404040', bold=false })
  vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffdd33', bold=false })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#404040', bold=false })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff", force = true })
  -- changes visual-whitespace fg color
  local visual = vim.api.nvim_get_hl(0, { name = "Visual" })
  vim.api.nvim_set_hl(0, "VisualNonText", {
    fg = "#707070",
    bg = visual.bg,
  })
end

if vim.g.neovide then
  require("neovide")
end
