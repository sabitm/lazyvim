return {
  -- add svelte grammar
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "svelte",
      })
    end,
  },
  -- add svelte lsp
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "svelte-language-server",
      })
    end,
  },
}
