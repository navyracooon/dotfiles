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
        opts = function()
            return {
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close,
                        },
                    },
                },
            }
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    }
}
