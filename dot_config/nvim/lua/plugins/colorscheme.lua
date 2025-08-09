return {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    init = function()
        vim.o.background = "light"
    end,
    opts = function()
        vim.g.edge_disable_italic_comment = 1
        vim.cmd.colorscheme("edge")
    end
}
