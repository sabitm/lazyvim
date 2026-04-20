-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable snacks animations
vim.g.snacks_animate = false

-- override clipboard
vim.opt.clipboard = ""

-- sonar LSP disabled by default
vim.g.sonar_enabled = false
vim.g.sonar_initialized = false

-- enable mojo lsp
vim.lsp.enable('mojo')
