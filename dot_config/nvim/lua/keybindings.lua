-- Local variables
local keymap = vim.keymap

-- Leader key
vim.g.mapleader = ' '

-- General keybindings
keymap.set('n', '<leader>a', 'ggVG')
keymap.set('n', '<leader>n', ':nohl<CR>')
keymap.set('n', '<leader>r', ':e!<CR>')
keymap.set('n', '<leader>v', 'gv')
keymap.set('v', '<leader>s', ':sort<CR>')

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

keymap.set('n', '<leader>p', '"0p')
keymap.set('v', '<leader>p', '"0p')

keymap.set('n', 'gD', vim.lsp.buf.declaration)
keymap.set('n', 'gd', vim.lsp.buf.definition)
keymap.set('n', '<space>e', vim.diagnostic.open_float)
keymap.set('n', 'K', vim.lsp.buf.hover)
keymap.set('n', 'gi', vim.lsp.buf.implementation)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
keymap.set('n', '<space>rn', vim.lsp.buf.rename)
keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
keymap.set('n', 'gr', vim.lsp.buf.references)
keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)

-- Plugin keybindings
--- Vaffle
keymap.set('n', '<leader>p', ':Vaffle<CR>')

--- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>j', builtin.find_files, {})
vim.keymap.set('n', '<leader>k', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
