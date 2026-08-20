require "nvchad.options"

-- add yours here!

local o = vim.o
 o.cursorlineopt ='both' -- to enable cursorline!

 -- custom lines
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.scrolloff = 8

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "Highlight when yanking stuff", 
    callback = function()
            vim.hl.on_yank()
    end,
})
