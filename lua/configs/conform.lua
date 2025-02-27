local options = {
  formatters_by_ft = {
    -- css = { "prettier" },
    -- html = { "prettier" },
    go = { "gofumpt", "golines", "goimports" },
    hcl = { "hclfmt" },
    json = { "jq" },
    lua = { "stylua" },
    proto = { "buf" },
    python = { "black" },
    terraform = { "terraform_fmt" },
    yaml = { "yq" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
