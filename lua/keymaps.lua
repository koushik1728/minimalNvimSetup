vim.g.mapleader = " "

--pasting without losing the copied text
vim.keymap.set("x", "p", [["_dP]], { desc = "paste over selection without losing yanked text"})

-- deletion without saving to copy register
vim.keymap.set({"n", "v"}, "<leader>d" ,[["_d]], { desc = "Delete without yanking"})

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search Highlighting"})

vim.keymap.set("n", "<leader>cd", "<cmd>Ex<cr>", {desc="Open file explorer"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection"})

vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "moves lines up in visual selection"})

vim.keymap.set("v", "<" ,"<gv", {desc = "Unindent and keep selection"})
vim.keymap.set("v", ">" ,">gv", {desc = "Unindent and keep selection"})

vim.keymap.set("n", "<C-d>" ,"<C-d>zz", {desc = "Keep the cursor centered and scroll half page down"})
vim.keymap.set("n", "<C-u>" ,"<C-u>zz", {desc = "Unindent and keep selection"})


vim.keymap.set("n", "n" ,"nzzzv", {desc = "Next search result is centered"})
vim.keymap.set("n", "N" ,"Nzzzv", {desc = "Previous search result is centered"})

vim.keymap.set("n", "<leader>s" ,[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Replace word split screen when using :%s/*/*/g"})
vim.keymap.set("n", "<leader>X" ,"<cmd>!chmod +x %<CR>", {desc = "Makes file executable"})

vim.keymap.set("n", "<leader>re" ,"<cmd>restart<cr>", {desc = "Makes file executable"})

vim.keymap.set("n","<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc= "Toggle Builtin Undotree"})
