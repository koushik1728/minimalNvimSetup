local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    c = { "clang_format"},
    cpp = { "clang_format"},

  },
keys = {
    {
      "<leader>ft",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
     end,
     mode = "",
   desc = "Format buffer",
   },
},
format_on_save = {
     -- These options will be passed to conform.format()
 timeout_ms = 500,
     lsp_fallback = true,
   },
}

return options
