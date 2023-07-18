return {
  -- add required packages
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "ruff",
      },
    },
  },
  -- configure auto formatter
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          -- already provided in LazyVim through extras in lazy.lua
          -- nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.ruff,
          nls.builtins.formatting.black,
        })
      end
    end,
  },
}
