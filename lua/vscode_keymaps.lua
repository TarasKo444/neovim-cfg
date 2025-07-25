local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

keymap({"i","n", "v"}, "<Esc>", "<cmd>lua require('vscode').action('hideSuggestWidget')<CR><Esc>", opts)
