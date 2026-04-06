local sonar_opts = {
  server = {
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
}

function _G.sonar_setup()
  if not vim.g.sonar_initialized then
    require("sonarlint").setup(sonar_opts)
    vim.g.sonar_initialized = true
  end
end

return {
  {
    "schrieveslaach/sonarlint.nvim",
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    config = function()
      if vim.g.sonar_enabled then
        sonar_setup()
      end
    end,
  },
}
