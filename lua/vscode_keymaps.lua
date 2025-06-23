local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

keymap("i", "<Esc>", "<cmd>lua require('vscode').action('hideSuggestWidget')<CR><Esc>", opts)
keymap({"n", "v"}, "<Esc>", "<cmd>lua require('vscode').action('hideSuggestWidget')<CR><Esc>", opts)
