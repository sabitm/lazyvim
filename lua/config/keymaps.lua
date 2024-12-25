-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add LspRestart keymap
vim.keymap.set("n", "<leader>cz", ":LspRestart<CR>", { desc = "Restart LSP" })
