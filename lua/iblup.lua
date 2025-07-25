require("lazy_init")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	{ import = "plugins_notvscode", cond = (function() return not vim.g.vscode end) },
	{ import = "plugins_always",    cond = true },
	{ import = "plugins_vscode",    cond = (function() return vim.g.vscode end) },
})

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.o.guifont="JetBrainsMono Nerd Font:h14:#e-subpixelantialias:#h-none"
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_cursor_short_animation_length = 0.01
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_scroll_animation_length = 0.1
end

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.autochdir = true
vim.o.list = true
vim.o.listchars = "tab:  "
vim.o.signcolumn = 'yes'
vim.opt.guicursor = "n-v-i-c:block-Cursor"
-- vim.diagnostic.config({ virtual_text = true, update_in_insert = false, })

vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add new line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add new line above" })
vim.keymap.set('n', 'go', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Add empty line below (count aware, preserves cursor)" })
vim.keymap.set('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Add empty line above (count aware, preserves cursor)" })

local opts = { noremap = true, silent = true }

vim.keymap.set({"n", "v"}, "<leader>y", '"+y', opts)
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', opts)
vim.keymap.set({"n", "v"}, "<leader>Y", '"+Y', opts)
vim.keymap.set({"n", "v"}, "<leader>P", '"+P', opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "J", ":m .+1<CR>==", opts)
vim.keymap.set("v", "K", ":m .-2<CR>==", opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { silent = true })

-- no more comments on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

local function remove_carriage_returns()
    vim.cmd('silent! %s/\\r//g')
    print("Carriage returns removed.")
end

vim.api.nvim_create_user_command(
  'RemoveCarriageReturns',
  remove_carriage_returns,  {
    desc = 'Remove carriage return characters from the buffer',
  }
)

if vim.g.vscode then
  -- VSCode Neovim
  require("vscode_keymaps")
end
