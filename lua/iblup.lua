require("lazy_init")
require("catppuccin").setup({
  no_italic = true
})
require("autoclose").setup()

vim.cmd.colorscheme("catppuccin")

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
-- vim.diagnostic.config({ virtual_text = true, update_in_insert = false, })

vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add new line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add new line above" })
vim.keymap.set('n', 'go', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Add empty line below (count aware, preserves cursor)" })
vim.keymap.set('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Add empty line above (count aware, preserves cursor)" })

if vim.g.vscode then
  -- VSCode Neovim
  require "vscode_keymaps"
end

local opts = { noremap = true, silent = true }
-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', opts)

-- better indent handling
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- move text up and down
vim.keymap.set("v", "J", ":m .+1<CR>==", opts)
vim.keymap.set("v", "K", ":m .-2<CR>==", opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

vim.keymap.set('n', '<leader>cr', ':%s/\\r//<CR>', opts)


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

vim.api.nvim_set_keymap('n', '<leader>cr', ':RemoveCarriageReturns<CR>', {noremap = true, silent = true})
