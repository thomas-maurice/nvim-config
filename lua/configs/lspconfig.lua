local lspconfig = require "lspconfig"

return {
  setup = function()
    local enabled_lsps = {
      "ansiblels",
      "bashls",
      "buf_ls",
      "docker_compose_language_service",
      "dockerls",
      "gh_actions_ls",
      "golangci_lint_ls",
      "gopls",
      "graphql",
      "helm_ls",
      "jsonls",
      "lua_ls",
      "pylsp",
      "pyre",
      "sqls",
      "terraformls",
      "ts_ls",
      "vuels",
      "yamlls",
    }

    lspconfig.jsonls.setup {
      on_attach = function(client, bufnr)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        if vim.fn.fnamemodify(filename, ":t") == "keyboard.json" then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      end,
    }

    for _, lsp in ipairs(enabled_lsps) do
      vim.lsp.enable(lsp)
    end
  end,
}

