return {
  -- apply gopls overrides only when lang.go extra is enabled
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if not LazyVim.has_extra("lang.go") then return end
      opts.servers = opts.servers or {}
      opts.servers.gopls = vim.tbl_deep_extend("force", opts.servers.gopls or {}, {
        settings = { gopls = { staticcheck = "unset" } },
      })
    end,
  },
  -- enable split long line
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters = {
  --       gofumpt = {
  --         env = { GOFUMPT_SPLIT_LONG_LINES = "on" },
  --       },
  --     },
  --   },
  -- },
}
