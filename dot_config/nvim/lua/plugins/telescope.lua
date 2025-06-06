return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>j", function() require("telescope.builtin").find_files() end },
            { "<leader>k", function() require("telescope.builtin").live_grep() end },
            { "<leader>r", function() require("telescope.builtin").lsp_references() end },
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    }
}
