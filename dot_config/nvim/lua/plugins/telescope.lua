return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
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
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
        end,
    }
}
