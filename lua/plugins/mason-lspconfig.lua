return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = require("configs.lspconfig").lsps_list
  },
}

