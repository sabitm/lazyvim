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
local function paste_escaped()
  -- Get the content of the unnamed register (which contains the copied text)
  local copied_text = vim.fn.getreg("+")

  -- Escape special characters in the copied text
  local escaped_text = escape_special_chars(copied_text)

  -- Paste the escaped text into the search bar
  vim.api.nvim_feedkeys("/" .. escaped_text, "n", false)
end

-- Map a key to trigger the paste_escaped function
vim.keymap.set("n", "g/", paste_escaped, { desc = "Paste escaped text into search" })

-- Add LspRestart keymap
vim.keymap.set("n", "<leader>cz", ":LspRestart<CR>", { desc = "Restart LSP" })

-- Delete to unused register instead
vim.keymap.set("n", "gzd", '"1d', { desc = "Delete to unused register" })
vim.keymap.set("n", "gzD", '"1D', { desc = "Delete till end to unused register" })
vim.keymap.set("v", "gzd", '"1d', { desc = "Delete to unused register" })
vim.keymap.set("v", "gzD", '"1D', { desc = "Delete till end to unused register" })

-- Yank to unused register
vim.keymap.set("n", "gzy", '"1y', { desc = "Yank to unused register" })
vim.keymap.set("n", "gzY", '"1Y', { desc = "Yank till end to unused register" })
vim.keymap.set("v", "gzy", '"1y', { desc = "Yank to unused register" })
vim.keymap.set("v", "gzY", '"1Y', { desc = "Yank till end to unused register" })

-- Paste from above register
vim.keymap.set("n", "gzp", '"1p', { desc = "Paste from above register" })
vim.keymap.set("n", "gzP", '"1P', { desc = "Paste before from above register" })
vim.keymap.set("v", "gzp", '"1p', { desc = "Paste from above register" })
vim.keymap.set("v", "gzP", '"1P', { desc = "Paste before from above register" })
