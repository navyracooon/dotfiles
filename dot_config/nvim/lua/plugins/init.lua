return require("lazy").setup({
    -- Colorscheme
    require("plugins.colorscheme"),
    -- Filer
    require("plugins.oil"),
    -- Telescope
    require("plugins.telescope"),
    -- Comment
    require("plugins.comment"),
    -- Visible Indent
    require("plugins.ibl"),
    -- Status line
    require("plugins.lualine"),
    -- Completion
    require("plugins.completion"),
    -- Editorconfig
    require("plugins.editorconfig"),
    -- LSP
    require("plugins.lsp"),
})
