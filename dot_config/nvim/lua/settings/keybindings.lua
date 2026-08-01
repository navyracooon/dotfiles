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
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set({"n", "x"}, "g=", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
