return {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
        { "<leader>o", function() require("oil").open() end },
        { "<leader>.", function() require("oil").toggle_hidden() end },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
