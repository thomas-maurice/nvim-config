local options = {
  formatters_by_ft = {
    -- css = { "prettier" },
    -- html = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    hcl = { "hcl" },
    json = { "jq" },
    lua = { "stylua" },
    proto = { "buf" },
    terraform = { "tflint" },
    yaml = { "yq" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
