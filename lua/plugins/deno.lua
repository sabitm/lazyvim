return {
  -- add deno lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {},
        tsserver = {
          single_file_support = false,
        },
      },
    },
  },
}
