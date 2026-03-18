return {
  -- add sonar lint lsp
  {
    "schrieveslaach/sonarlint.nvim",
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    opts = {
      server = {
        -- Path to the sonar-lint-language-server executable
        cmd = {
          vim.fn.expand("$HOME/.local/share/nvim/mason/bin/sonarlint-language-server"),
          "-stdio",
          "-analyzers",
          vim.fn.expand("$HOME/.local/share/nvim/mason/share/sonarlint-analyzers/sonargo.jar"),
        },
      },
      filetypes = {
        "go",
      },
    },
  },
}
