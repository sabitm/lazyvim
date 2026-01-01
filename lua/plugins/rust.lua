-- configure rust-analyzer
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, _)
      -- disable semantic highlighting
      client.server_capabilities.semanticTokensProvider = nil
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cachePriming = {
          enable = false,
        },
        cargo = {
          buildScripts = {
            enable = false,
          },
        },
        checkOnSave = true,
        check = {
          command = "check",
        },
        diagnostics = {
          enable = false,
        },
      },
    },
  },
}

return {}
