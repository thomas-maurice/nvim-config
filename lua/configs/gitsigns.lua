---@type Gitsigns.Config
---@diagnostic disable: missing-fields
return {
  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
  numh = true,
  word_diff = true,
}
