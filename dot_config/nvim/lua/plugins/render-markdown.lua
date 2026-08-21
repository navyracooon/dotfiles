return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-mini/mini.icons",
    },
    ft = { "markdown" },
    keys = {
        {
            "<leader>md",
            "<cmd>RenderMarkdown toggle<cr>",
            desc = "Toggle Markdown rendering",
        },
    },
    opts = {
        enabled = false,
    },
}
