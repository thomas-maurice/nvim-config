return {
  -- treesitter
  require "plugins.nvim-treesitter",
  -- formatter & linter
  require "plugins.conform",
  require "plugins.nvim-lint",
  -- LSP config
  require "plugins.mason-lspconfig",
  -- Go config
  require "plugins.go-nvim",
  -- Leap search
  require "plugins.leap",
  -- Snacks
  require "plugins.snacks",
  -- Trouble
  require "plugins.trouble",
  -- Markdown rendering
  require "plugins.render-markdown",
  -- gitsigns
  require "plugins.gitsigns",
  -- minimap
  require "plugins.neominimap",
  -- lspnotify
  require "plugins.lspnotify",
  -- godoc
  require "plugins.godoc",
  -- mason
  require "plugins.mason-tool-installer",
}
