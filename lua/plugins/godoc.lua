return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "folke/snacks.nvim" },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "go" },
      },
    },
  },
  build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
  cmd = { "GoDoc" },
  opts = {
    adapters = {
      {
        name = "go",
        opts = {
          command = "GoDoc", -- the vim command to invoke Go documentation
        },
      },
    },
    window = {
      type = "split", -- split | vsplit
    },
    picker = {
      type = "snacks",
    },
  },
}
