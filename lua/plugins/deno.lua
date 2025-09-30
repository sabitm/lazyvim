return {
  -- add deno lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          root_markers = { "deno.json", "deno.jsonc" },
          mason = false,
        },
        vtsls = {
          single_file_support = false,
          mason = false,
        },
      },
    },
  },
}
