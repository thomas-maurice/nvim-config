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

  format_on_save = function(bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if vim.fn.fnamemodify(filename, ":t") == "keyboard.json" then
      return
    end
    return { lsp_fallback = true }
  end,
}

return options
