return {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.edge_disable_italic_comment = 1
        vim.cmd.colorscheme("edge")
    end
}
