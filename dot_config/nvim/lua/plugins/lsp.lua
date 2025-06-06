return {
    -- Bridges mason and nvim-lspconfig
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} }, -- Language Server Manager
        "neovim/nvim-lspconfig",               -- LSP Config
    },
    opts = {},
}
