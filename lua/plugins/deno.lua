return {
  -- add deno lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
        },
        vtsls = {
          single_file_support = false,
        },
      },
    },
  },
}
