return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "edge",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diagnostics" },
            lualine_c = {},
            lualine_x = { function() return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~") end },
            lualine_y = { "filename" },
            lualine_z = { "filetype" },
        },
    }
}
