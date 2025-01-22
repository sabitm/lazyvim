-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add LspRestart keymap
vim.keymap.set("n", "<leader>cz", ":LspRestart<CR>", { desc = "Restart LSP" })

-- Delete to unused register instead
vim.keymap.set("n", "gd", '"1d', { desc = "Delete to unused register" })
vim.keymap.set("n", "gD", '"1D', { desc = "Delete till end to unused register" })
vim.keymap.set("v", "gd", '"1d', { desc = "Delete to unused register" })
vim.keymap.set("v", "gD", '"1D', { desc = "Delete till end to unused register" })
