-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to escape all special characters in the text
local function escape_special_chars(text)
  -- List of characters to escape
  local special_chars = { ".", "*", "^", "$", "[", "]", "\\", "~", "?", "/" }

  -- Create a lookup table for special characters
  local special_chars_lookup = {}
  for _, char in ipairs(special_chars) do
    special_chars_lookup[char] = true
  end

  -- Iterate over each character in the text
  local result = ""
  for i = 1, #text do
    local char = text:sub(i, i)
    if special_chars_lookup[char] then
      result = result .. "\\" .. char -- Escape the character
    else
      result = result .. char -- Keep the character as is
    end
  end

  return result
end

-- Function to paste escaped text into the search bar
local function paste_escaped_local()
  -- Get the content of the unnamed register (which contains the copied text)
  local copied_text = vim.fn.getreg('"')

  -- Escape special characters in the copied text
  local escaped_text = escape_special_chars(copied_text)

  -- Paste the escaped text into the search bar
  vim.api.nvim_feedkeys("/" .. escaped_text, "n", false)
end

-- Function to paste escaped text into the search bar
local function paste_escaped()
  -- Get the content of the unnamed register (which contains the copied text)
  local copied_text = vim.fn.getreg("+")

  -- Escape special characters in the copied text
  local escaped_text = escape_special_chars(copied_text)

  -- Paste the escaped text into the search bar
  vim.api.nvim_feedkeys("/" .. escaped_text, "n", false)
end

-- Trigger the paste_escaped_local function
vim.keymap.set("n", "g/", paste_escaped_local, { desc = "Paste local escaped text into search" })

-- Trigger the paste_escaped function
vim.keymap.set("n", "gz/", paste_escaped, { desc = "Paste escaped text into search" })

-- Add LspRestart keymap
vim.keymap.set("n", "<leader>cz", ":LspRestart<CR>", { desc = "Restart LSP" })

-- Toggle Codeium
vim.keymap.set("n", "<leader>cx", ":Codeium Toggle<CR>", { desc = "Toggle Codeium" })

-- Copy current file path to system clipboard
vim.keymap.set("n", "<leader>fP", ":let @+ = expand('%:p')<CR>", { desc = "Copy current file path" })

-- Copy current file name to system clipboard
vim.keymap.set("n", "<leader>fy", ":let @+ = expand('%:t')<CR>", { desc = "Copy current file name" })

-- Delete to system clipboard
vim.keymap.set("n", "gzd", '"+d', { desc = "Delete to system clipboard" })
vim.keymap.set("n", "gzD", '"+D', { desc = "Delete till end to system clipboard" })
vim.keymap.set("v", "gzd", '"+d', { desc = "Delete to system clipboard" })
vim.keymap.set("v", "gzD", '"+D', { desc = "Delete till end to system clipboard" })

-- Yank to system clipboard
vim.keymap.set("n", "gzy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "gzY", '"+y$', { desc = "Yank till end to system clipboard" })
vim.keymap.set("v", "gzy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "gzY", '"+y$', { desc = "Yank till end to system clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "gzp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "gzP", '"+P', { desc = "Paste before from system clipboard" })
vim.keymap.set("v", "gzp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "gzP", '"+P', { desc = "Paste before from system clipboard" })

-- Wait forever for mapped key sequences
vim.o.timeout = false
