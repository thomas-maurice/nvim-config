require "nvchad.mappings"

local map = vim.keymap.set
local lspbuf = vim.lsp.buf

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Editing
-- use U for redos
map("n", "U", "<C-r>", { desc = "Redo" })

-- Copying in pasting
map("v", "<leader>y", [["+y]], { desc = "Copy in the system's clipboard" })
map("n", "<leader>P", [["+p]], { desc = "Paste from the system's clipboard" })

-- Telescope bindings
local telescope = require "telescope.builtin"

map("n", "<leader>ff", telescope.find_files, {})
map("n", "<leader>fg", telescope.live_grep, {})
map("n", "<leader>fb", telescope.buffers, {})
map("n", "<leader>fh", telescope.help_tags, {})

local lsp_prefix = "<leader>l"
-- LSP stuff
map("n", lsp_prefix .. "h", function()
  lspbuf.hover()
  lspbuf.hover()
end, { desc = "LSP hover info" })
map("n", lsp_prefix .. "r", lspbuf.rename, { desc = "Rename symbol" })
map("n", lsp_prefix .. "i", lspbuf.implementation, { desc = "Go to implementations" })
map("n", lsp_prefix .. "d", lspbuf.definition, { desc = "Go to definition" })
map("n", lsp_prefix .. "D", lspbuf.declaration, { desc = "Go to declaration" })

-- Tree
map("n", "<leader>tf", ":NvimTreeFocus<CR>", { desc = "Focuses on the nav tree" })

-- Focus on a given buffer
for i = 1, 9, 1 do
  map("n", "<leader>t" .. i, i .. "gt", { desc = "Go to vim tab #" .. i })
end

for i = 1, 9, 1 do
  map("n", "<leader>" .. i, function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = "Go to tabbed buffer #" .. i })
end

-- Save and quit keymaps
map("n", "<leader>w", ":w<CR>", { desc = "Writes current buffer" })
map("n", "<leader>a", ":wa<CR>", { desc = "Writes all buffers " })
map("n", "<leader>q", ":wqa<CR>", { desc = "Quits vim" })
