-- Leader key
vim.g.mapleader = " "

-- General keybindings
local keymap = vim.keymap

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

keymap.set("n", "<leader>a", "ggVG")
keymap.set("n", "<leader>n", ":nohl<CR>")
keymap.set("n", "<leader>v", "gv")
keymap.set("v", "<leader>s", ":sort<CR>")

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition)
keymap.set("n", "gD", vim.lsp.buf.declaration)
keymap.set("n", "K", vim.lsp.buf.hover)

keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
keymap.set("n", "<leader>e", vim.diagnostic.open_float)
keymap.set({"n", "x"}, "<leader>f", function() vim.lsp.buf.format { async = true } end)
