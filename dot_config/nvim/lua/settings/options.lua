-- Local variables
local opt = vim.opt

-- Line numbers
opt.number = true         -- Show absolute row number
opt.relativenumber = true -- Show relative row number

-- Tabs & indentations
opt.autoindent = true -- Predict indent from previous row
opt.expandtab = true  -- Type Space with Tab
opt.shiftwidth = 4    -- Set the width of indentation
opt.tabstop = 4       -- Set the width of tab

-- Line wrapping
opt.breakindent = true -- Follow indentation when wrapping a long line
opt.showbreak = ">"    -- Explicitly tells whether the line is wrapped or not

-- Search settings
opt.ignorecase = true -- Ignore upper/lowercase when searching
opt.smartcase = true  -- Ignore 'ignorecase' when containing uppercase

-- Appearance
opt.conceallevel = 0     -- Avoid omitting "" when editing JSON
opt.termguicolors = true -- Show correct color
opt.pumheight = 10       -- Set the height of completion window

-- Clipboard
local function default_paste() -- For security issue, I don't use OSC 52 for pasting
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

vim.g.clipboard = {
    name = "OSC 52", -- Use OSC 52 to use system clipboard
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = default_paste,
        ["*"] = default_paste,
    },
    cache_enabled = false,
}

opt.clipboard:append("unnamedplus")

-- Swapfile
opt.swapfile = false -- Disable swapfile

-- Undofile
opt.undofile = true -- Enables undofile

-- Edditing
opt.iskeyword:append("-") -- Make words contain hyphens to one word
