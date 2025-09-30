return {
  -- disable staticcheck
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              staticcheck = "unset",
            },
          },
          mason = false,
        },
      },
    },
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
