require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Telescope bindings
local telescope = require "telescope.builtin"

map("n", "<leader>ff", telescope.find_files, {})
map("n", "<leader>fg", telescope.live_grep, {})
map("n", "<leader>fb", telescope.buffers, {})
map("n", "<leader>fh", telescope.help_tags, {})

-- Tree
map("n", "<leader>tf", ":NvimTreeFocus<CR>", {})

-- Focus on a given buffer
for i = 1, 9, 1 do
  map("n", "<leader>t" .. i, i .. "gt", {})
end

for i = 1, 9, 1 do
  map("n", "<leader>" .. i, function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- Save and quit keymaps
map("n", "<leader>w", ":w<CR>", {})
map("n", "<leader>a", ":wa<CR>", {})
map("n", "<leader>q", ":wqa<CR>", {})
