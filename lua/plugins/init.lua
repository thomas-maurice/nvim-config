return {
  -- treesitter
  require "plugins.nvim-treesitter",
  require "plugins.nvim-treesitter-context",
  -- formatter & linter
  require "plugins.conform",
  require "plugins.nvim-lint",
  -- LSP config
  require "plugins.mason-lspconfig",
  -- Go config
  require "plugins.go-nvim",
  require "plugins.godoc",
  -- Search
  require "plugins.leap",
  -- Snacks
  require "plugins.snacks",
  -- Trouble
  require "plugins.trouble",
  -- Markdown rendering
  require "plugins.render-markdown",
  -- git stuff
  require "plugins.gitsigns",
  require "plugins.lazygit",
  -- minimap
  require "plugins.neominimap",
  -- lspnotify
  require "plugins.lspnotify",
  -- mason
  require "plugins.mason-lspconfig",
  require "plugins.mason-tool-installer",
}
