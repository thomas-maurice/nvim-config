return {
  --dir = "~/git/lspnotify.nvim",
  --dev = true,
  --name = "lspnotify",
  "thomas-maurice/lspnotify.nvim",
  ft = "*",
  ---@type lspnotify.LSPNotifyConfig
  opts = require "configs.lspnotify",
}
