require("lazy_init")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	-- { import = "plugins_always",    cond = true },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
	{ import = "plugins_notvscode", cond = (function() return not vim.g.vscode end) },
	{ import = "plugins_vscode",    cond = (function() return vim.g.vscode end) },
})

vim.cmd.colorscheme("gruber-darker")

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 8
vim.o.smarttab = true
vim.bo.softtabstop = 0
vim.bo.expandtab = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.autochdir = true
vim.o.list = true
vim.o.listchars = "tab:  "
vim.o.signcolumn = 'yes'
vim.opt.guicursor = {
  'n-v-c:block-Cursor',
  'i-ci:block-Cursor/lCursor-blinkon400-blinkoff400',
  'r:block-Cursor'
}
-- vim.diagnostic.config({ virtual_text = true, update_in_insert = false, })

vim.o.scrolloff = 5
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

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

-- renames everything selected
vim.keymap.set("v", "<leader>r", ":s/\\%V//g<Left><Left><Left>")

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
end

if vim.g.neovide then
  require("neovide")
end
