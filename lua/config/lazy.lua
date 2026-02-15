local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local spec = {
  -- core plugins
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },

  -- extras
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.editor.mini-move" },
}

-- full mode additional extras
if not vim.g.lite_mode then
  table.insert(spec, { import = "lazyvim.plugins.extras.ai.codeium" })
end

-- custom plugins
table.insert(spec, { import = "plugins" })

-- lite mode overrides
if vim.g.lite_mode then
  vim.list_extend(spec, {
    { "neovim/nvim-lspconfig", enabled = false },
    { "mason-org/mason.nvim", enabled = false },
    { "mason-org/mason-lspconfig.nvim", enabled = false },
    { "stevearc/conform.nvim", enabled = false },
    { "mfussenegger/nvim-lint", enabled = false },
    { "hrsh7th/nvim-cmp", enabled = false },
    { "folke/trouble.nvim", enabled = false },
    { "mrcjkb/rustaceanvim", enabled = false },
  })
end

require("lazy").setup({
  spec = spec,
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = {} },
  checker = {
    enabled = false,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
