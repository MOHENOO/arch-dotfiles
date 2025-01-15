-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if not vim.g.vscode then
  local map = LazyVim.safe_keymap_set

  map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Go to left window", remap = true })
  map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Go to lower window", remap = true })
  map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Go to upper window", remap = true })
  map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Go to right window", remap = true })

  -- Neogit
  -- map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit (root dir)" })
  -- map("n", "<leader>gG", "<cmd>Neogit cwd=<cwd><cr>", { desc = "Neogit (cwd)" })
end

-- Disable Alt-j/k move line
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

-- map jk as esc
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
