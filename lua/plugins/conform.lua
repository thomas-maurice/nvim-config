return {
  "stevearc/conform.nvim",
  -- for format on save
  event = "BufWritePre",
  opts = require "configs.conform",
}
