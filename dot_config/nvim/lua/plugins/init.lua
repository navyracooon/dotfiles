return require("lazy").setup({
    -- Colorscheme
    require("plugins.colorscheme"),
    -- Comment
    require("plugins.comment"),
    -- Completion
    require("plugins.completion"),
    -- Editorconfig
    require("plugins.editorconfig"),
    -- Filer
    require("plugins.oil"),
    -- Flash
    require("plugins.flash"),
    -- LSP
    require("plugins.lsp"),
    -- Status line
    require("plugins.lualine"),
    -- Telescope
    require("plugins.telescope"),
    -- Visible Indent
    require("plugins.ibl"),
})
