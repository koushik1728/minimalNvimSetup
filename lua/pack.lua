-- Install plugins with vim.pack
vim.pack.add({
    { src = "https://github.com/bluz71/vim-moonfly-colors", name = "moonfly" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },

})

-- Optional: set colorscheme
vim.cmd("colorscheme moonfly")

-- Mini files
local MiniFiles = require("mini.files")
MiniFiles.setup({
  mappings = {
    go_in = "<CR>",
    go_in_plus = "l",
    go_out = "_",
    go_out_plus = "h",
  },
})

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<cr>", { desc = "toggle mini file explorer" })
vim.keymap.set("n", "<ESC>", "<cmd>lua MiniFiles.close()<cr>", { desc = "toggle mini file explorer" })

vim.keymap.set("n", "<leader>-", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end, { desc = "toggle mini file explorer" })

-- Mini notify
require("mini.notify").setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
 { tool="fallback" },
    }
})

-- There is NO mini.cmdline module in mini.nvim (yet).
-- Either remove this line or use a different plugin (e.g. noice.nvim, mini.clue, etc.).
require("mini.cmdline").setup({
    autocorrect = {enable=false}
})

require("mini.surround").setup()
-- Default keymap
-- sa
-- sd
-- sr
-- sf

local MiniPick = require("mini.pick")

MiniPick.setup()

vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files({ tool="fallback"}) end, { desc="Mini file picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ tool="fallback",pattern = vim.fn.expand("<cword>")}) end, {desc="Mini file picker"})
vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, {desc="Mini Help"})

local MiniExtras = require("mini.extra")
MiniExtras.setup()

vim.keymap.set("n", "<leader>xx", function() MiniExtras.pickers.diagnostic() end, { desc="Mini picker" })
vim.keymap.set("n", "<leader>pk", function() MiniExtras.pickers.keymaps() end, { desc="Search keymaps" })

--mini completion

local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
    lst_completion = {
        auto_setup = true,
        process_items = function(items,base)
            return MiniCompletion.default_process_items(item, base,{
                filtersort = "fuzzy",
            })
        end
    },
})

local MiniSnippets = require("mini.snippets")

MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(),
    },
    expand = {
        insert = function(snippet)
            -- disables the dot inside funtion brackets
            MiniSnippets.default_insert(snippet, { empty_tabstop=""})
        end,
    },
})

MiniSnippets.start_lsp_server({ match = false})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0,"MiniSnippetsCurrent", {})
        vim.api.nvim_set_hl(0,"MiniSnippetsCurrentReplace", {})
        vim.api.nvim_set_hl(0,"MiniSnippetsFinal", {})
        vim.api.nvim_set_hl(0,"MiniSnippetsUnvisited", {})
        vim.api.nvim_set_hl(0,"MiniSnippetsVisited", {})

    end
})

require("treesitter")
