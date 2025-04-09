-- Fail safe
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- General
--- Keymaps
local keymap = vim.keymap
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr}
    keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

--- LSP settings
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["texlab"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["pylsp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
